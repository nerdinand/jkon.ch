# frozen_string_literal: true

# typed: strict

# A JotForm form submission with useful readers and extractors for the fields we need
class Submission
  extend T::Sig

  FIELD_NAMES = T.let(%w[
                        name
                        address
                        birth_date
                        phone
                        email
                        curriculum_vitae
                        website
                        instagram_handle
                        dossier
                        exhibition_proposal
                      ], T::Array[String])

  FIELD_NAMES.each do |field_name|
    attr_reader(field_name)
  end

  sig { returns(String) }
  attr_reader :id

  sig { params(submission_hash: T::Hash[T.untyped, T.untyped]).void }
  def initialize(submission_hash)
    @id = T.let(submission_hash['id'], String)
    @answers_hash = T.let(submission_hash['answers'], T::Hash[T.untyped, T.untyped])
    fill_instance_variables!
  end

  private

  sig { returns(T::Array[String]) }
  def fill_instance_variables!
    FIELD_NAMES.each do |field_name|
      instance_variable_set(:"@#{field_name}", extract_value(field_name))
    end
  end

  sig { params(field_name: String).returns(T.nilable(String)) }
  def extract_value(field_name)
    field = find_field(field_name)

    return nil if field.nil?

    send(:"extract_#{field['type']}", field)
  end

  sig { params(field_name: String).returns(T.nilable(T::Hash[T.untyped, T.untyped])) }
  def find_field(field_name)
    return nil if @answers_hash.nil?

    # p @answers_hash.map { |k, v| v['name'] }
    found = @answers_hash.find { |_k, v| v['name'] == field_name }
    raise "#{field_name} not found" if found.nil?

    found.last
  end

  sig { params(field: T::Hash[String, String]).returns(T.nilable(String)) }
  def extract_control_fullname(field)
    field['prettyFormat']
  end

  sig { params(field: T::Hash[String, String]).returns(T.nilable(String)) }
  def extract_control_address(field)
    answer = field['answer']
    return nil if answer.nil?

    [
      answer['addr_line1'],
      answer['addr_line2'],
      "#{answer['postal']} #{answer['city']}",
      answer['country']
    ].compact.reject(&:empty?).join('<br>')
  end

  sig { params(field: T::Hash[String, String]).returns(T.nilable(String)) }
  def extract_control_datetime(field)
    field['prettyFormat']
  end

  sig { params(field: T::Hash[String, String]).returns(T.nilable(String)) }
  def extract_control_phone(field)
    field['prettyFormat']
  end

  sig { params(field: T::Hash[String, String]).returns(T.nilable(String)) }
  def extract_control_email(field)
    field['answer']
  end

  sig { params(field: T::Hash[String, String]).returns(T.nilable(String)) }
  def extract_control_textarea(field)
    field['answer']
  end

  sig { params(field: T::Hash[String, String]).returns(T.nilable(String)) }
  def extract_control_textbox(field)
    field['answer']
  end

  sig { params(field: T::Hash[String, T::Array[String]]).returns(T.nilable(String)) }
  def extract_control_fileupload(field)
    answer = field['answer']
    return nil if answer.nil?

    answer = answer.first
    return nil if answer.nil?

    # Hack to fix wrongly encoded spaces in url
    path, filename = File.split(answer)
    [path, URI.encode_uri_component(filename)].join('/')
  end
end
