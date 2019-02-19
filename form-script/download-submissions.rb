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
  attr_reader :id

  def initialize(id, answers_hash)
    @id = id
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
    [
      field['answer']['addr_line1'], 
      field['answer']['addr_line2'], 
      field['answer']['postal'] + ' ' + field['answer']['city'], 
      field['answer']['country']
    ].reject(&:empty?).join('<br>')
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
    FileUtils.mkdir_p(submission.id)

    File.write(
      submission.id + '/' + pdf_file_name,
      WickedPdf.new.pdf_from_string(html_source)
    )
  end

  def html_source
    '<!DOCTYPE html>' +
    '<html>' +
    '<head>' +
      '<meta charset="utf-8">' +
    '</head>' +
    '<body style="font-family: Arial;">' +
      "<h1>#{submission.send(TITLE_FIELD)}</h1>" +
      '<table style="border-spacing: 10px;">
        <tbody>' +
    TEXT_FIELDS.map do |field_name|
      "<tr>
        <td valign=\"top\"><strong>#{field_name}</strong></td>
        <td>#{submission.send(field_name)&.gsub("\n", '<br>')}</td>
      </tr>"
    end.join +
    '   </tbody>
      </table>
      <div style="page-break-before: always;" />' +
      "<img src=\"#{submission.portrait}\" style=\"max-width: 900px; max-height: 1400px;\"/>" +
    '</body>' +
    '</html>'
  end

  private

  def pdf_file_name
    'summary.pdf'
  end

  attr_reader :submission
end

class AttachmentDownload
  def initialize(submission_id, url, file_name)
    @submission_id = submission_id
    @url = url
    @file_name = file_name
  end

  def download!
    system("curl -L -s '#{url}' > #{write_path}")
  end

  private

  attr_reader :submission_id, :url, :file_name

  def write_path
    "#{submission_id}/#{file_name}"
  end
end

class PDFCombination
  def initialize(out_pdf_path, *in_pdf_paths)
    @out_pdf_path = out_pdf_path
    @in_pdf_paths = in_pdf_paths
  end

  def combine!
    system("\"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py\" -o #{out_pdf_path} #{in_pdf_paths.join(' ')}")
  end

  attr_reader :out_pdf_path, :in_pdf_paths
end

response = Net::HTTP.get(
  URI("https://eu-api.jotform.com/form/#{JOTFORM_FORM_ID}/submissions?apiKey=#{api_key}&limit=1000")
)

FileUtils.mkdir_p('out')

submissions = JSON.parse(response)['content']

submissions_count = submissions.count

submissions.each.with_index do |submission, index|
  submission_id = submission['id']

  submission = Submission.new(submission_id, submission['answers'])
  PDFExport.new(submission).export!

  AttachmentDownload.new(submission_id, submission.dossier, 'dossier.pdf').download!
  AttachmentDownload.new(submission_id, submission.exhibition_proposal, 'exhibition_proposal.pdf').download!

  combined_pdf_file_name = submission.name.gsub(/[^A-Za-z]/, '-') + '.pdf'
  PDFCombination.new("out/#{combined_pdf_file_name}", "#{submission_id}/summary.pdf", "#{submission_id}/exhibition_proposal.pdf", "#{submission_id}/dossier.pdf").combine!
  puts "#{index + 1}/#{submissions_count} (#{submission_id}) > #{combined_pdf_file_name}"
end

