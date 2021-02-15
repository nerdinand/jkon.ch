# typed: true

require 'net/http'
require 'uri'
require 'awesome_print'
require 'json'
require 'pry-byebug'
require 'fileutils'
require 'sorbet-runtime'

require_relative 'submission'
require_relative 'pdf_export'
require_relative 'attachment_download'
require_relative 'pdf_combination'

JOTFORM_FORM_ID = 203494655758368
api_key = ENV['API_KEY']

def process_submission(submission)
  submission_id = submission['id']

  submission = Submission.new(submission_id, submission['answers'])
  PDFExport.new(submission).export!

  AttachmentDownload.new(submission_id, submission.dossier, 'dossier.pdf').download!
  AttachmentDownload.new(submission_id, submission.exhibition_proposal, 'exhibition_proposal.pdf').download!

  combined_pdf_file_name = submission.name.gsub(/[^A-Za-z]/, '-') + '.pdf'
  while File.exists? "out/#{combined_pdf_file_name}"
    combined_pdf_file_name = "#{combined_pdf_file_name[0..-5]}-1.pdf"
  end

  combined_pdf_path = "out/#{combined_pdf_file_name}"

  PDFCombination.new(combined_pdf_path, "#{submission_id}/summary.pdf", "#{submission_id}/exhibition_proposal.pdf", "#{submission_id}/dossier.pdf").combine!

  combined_pdf_file_name
end

submission_id_argument = ARGV[0]

response = Net::HTTP.get(
  URI("https://eu-api.jotform.com/form/#{JOTFORM_FORM_ID}/submissions?apiKey=#{api_key}&limit=1000")
)

FileUtils.mkdir_p('out')

submissions = JSON.parse(response)['content']

submissions_count = submissions.count

puts "#{submissions_count} submissions"

if submission_id_argument
  submission = submissions.find { |s| s['id'] == submission_id_argument }
  process_submission(submission)
else
  submissions.each.with_index do |submission, index|
    combined_pdf_file_name = process_submission(submission)
    puts "#{index + 1}/#{submissions_count} (#{submission['id']}) > out/#{combined_pdf_file_name}"
  end
end
