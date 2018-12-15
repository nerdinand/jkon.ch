require 'net/http'
require 'uri'
require 'awesome_print'
require 'json'
require 'pry-byebug'
require 'wicked_pdf'

JOTFORM_FORM_ID = 83444216427355
api_key = ENV['API_KEY']

class Submission
  FIELD_NAMES = %w(
    name
    address
    birth_date
    phone
    email
    curriculum_vitae
    website
    instagram_handle
    portrait
    dossier
    exhibition_proposal
  )

  attr_reader(*FIELD_NAMES)

  def initialize(answers_hash)
    @answers_hash = answers_hash
    fill_instance_variables!
    @answers_hash = nil
  end

  private

  def fill_instance_variables!
    FIELD_NAMES.each do |field_name|
      instance_variable_set(:"@#{field_name}", extract_value(field_name))
    end
  end

  def extract_value(field_name)
    field = find_field(field_name)

    send("extract_#{field['type']}", field)
  end

  def find_field(field_name)
    found = @answers_hash.find { |k, v| v['name'] == field_name }
    raise "#{field_name} not found" if found.nil?
    found.last
  end

  def extract_control_fullname(field)
    field['prettyFormat']
  end

  def extract_control_address(field)
    field['prettyFormat']#.gsub('<br>', "\n")
  end

  def extract_control_datetime(field)
    field['prettyFormat']
  end

  def extract_control_phone(field)
    field['prettyFormat']
  end

  def extract_control_email(field)
    field['answer']
  end

  def extract_control_textarea(field)
    field['answer']
  end

  def extract_control_textbox(field)
    field['answer']
  end

  def extract_control_fileupload(field)
    field['answer'].first
  end
end

class PDFExport
  TITLE_FIELD = 'name'

  TEXT_FIELDS = %w[
    address
    birth_date
    phone
    email
    curriculum_vitae
    website
    instagram_handle
  ]

  def initialize(submission)
    @submission = submission
  end

  def export!
    File.write(
      submission.name.gsub(/[^A-Za-z]/, '-') + '.pdf', 
      WickedPdf.new.pdf_from_string(html_source)
    )
  end

  def html_source
    '<body style="font-family: Arial;">' +
      "<h1>#{submission.send(TITLE_FIELD)}</h1>" +
      '<table>
        <tbody>' +
    TEXT_FIELDS.map do |field_name|
      "<tr>
        <td><strong>#{field_name}</strong></td>
        <td>#{submission.send(field_name)}</td>
      </tr>"
    end.join +
    '   </tbody>
      </table>
      <div style="page-break-before: always;" />' +
      "<img src=\"#{submission.portrait}\" style=\"max-width: 900px; max-height: 1400px;\"/>" +
    '</body>'
  end

  private

  attr_reader :submission
end

response = Net::HTTP.get(
  URI("https://eu-api.jotform.com/form/#{JOTFORM_FORM_ID}/submissions?apiKey=#{api_key}&limit=1000")
)

JSON.parse(response)['content'].each do |submission|
  submission = Submission.new(submission['answers'])
  ap submission
  PDFExport.new(submission).export!
end
