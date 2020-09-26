# typed: strict

class Submission
  extend T::Sig

  FIELD_NAMES = T.let(%w(
    name
    address
    birth_date
    phone
    email
    curriculum_vitae
    website
    instagram_handle
    portraitneutraler
    dossier
    exhibition_proposal
  ), T::Array[String])

  FIELD_NAMES.each do |field_name|
    attr_reader(field_name)
  end

  sig {returns(String)}
  attr_reader :id

  sig {params(id: String, answers_hash: T.nilable(T::Hash[String, T::Hash[String, String]])).void}
  def initialize(id, answers_hash)
    @id = id
    @answers_hash = answers_hash
    fill_instance_variables!
    @answers_hash = nil
  end

  private

  sig {returns(T::Array[String])}
  def fill_instance_variables!
    FIELD_NAMES.each do |field_name|
      instance_variable_set(:"@#{field_name}", extract_value(field_name))
    end
  end

  sig {params(field_name: String).returns(T.nilable(String))}
  def extract_value(field_name)
    field = find_field(field_name)

    return nil if field.nil?

    send("extract_#{field['type']}", field)
  end

  sig {params(field_name: String).returns(T.nilable(T::Hash[T.untyped, T.untyped]))}
  def find_field(field_name)
    return nil if @answers_hash.nil?
    # p @answers_hash.map { |k, v| v['name'] }
    found = @answers_hash.find { |k, v| v['name'] == field_name }
    raise "#{field_name} not found" if found.nil?
    found.last
  end
  
  sig {params(field: T::Hash[String, String]).returns(T.nilable(String))}
  def extract_control_fullname(field)
    field['prettyFormat']
  end

    
  sig {params(field: T::Hash[String, String]).returns(T.nilable(String))}
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
  
  sig {params(field: T::Hash[String, String]).returns(T.nilable(String))}
  def extract_control_datetime(field)
    field['prettyFormat']
  end
  
  sig {params(field: T::Hash[String, String]).returns(T.nilable(String))}
  def extract_control_phone(field)
    field['prettyFormat']
  end
  
  sig {params(field: T::Hash[String, String]).returns(T.nilable(String))}
  def extract_control_email(field)
    field['answer']
  end
  
  sig {params(field: T::Hash[String, String]).returns(T.nilable(String))}
  def extract_control_textarea(field)
    field['answer']
  end
  
  sig {params(field: T::Hash[String, String]).returns(T.nilable(String))}
  def extract_control_textbox(field)
    field['answer']
  end
  
  sig {params(field: T::Hash[String, String]).returns(T.nilable(String))}
  def extract_control_fileupload(field)
    answer = field['answer']
    return nil if answer.nil?
    answer.first
  end
end
