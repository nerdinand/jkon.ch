# frozen_string_literal: true

# typed: ignore

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

if __FILE__ == $PROGRAM_NAME
  JOTFORM_FORM_ID = 213_185_814_039_355
  api_key = ENV.fetch('API_KEY')

  def determine_free_file_name(submission_name)
    combined_pdf_file_name = "#{submission_name.gsub(/[^A-Za-z]/, '-')}.pdf"
    combined_pdf_file_name = "#{combined_pdf_file_name[0..-5]}-1.pdf" while File.exist? "out/#{combined_pdf_file_name}"
    combined_pdf_file_name
  end

  def download_attachments(submission)
    exhibition_proposal_path = AttachmentDownload.new(submission.id, submission.exhibition_proposal,
                                                      'exhibition_proposal.pdf').download!
    dossier_path = AttachmentDownload.new(submission.id, submission.dossier, 'dossier.pdf').download!
    [exhibition_proposal_path, dossier_path]
  end

  def process_submission(submission)
    submission = Submission.new(submission)

    summary_path = PDFExport.new(submission).export!

    pdf_paths = [summary_path] + download_attachments(submission)

    combined_pdf_file_name = determine_free_file_name(submission.name)
    combined_pdf_path = "out/#{combined_pdf_file_name}"

    PDFCombination.new(combined_pdf_path, pdf_paths).combine!

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
    process_submission(submissions.find { |s| s['id'] == submission_id_argument })
  else
    submissions.each.with_index do |submission, index|
      combined_pdf_file_name = process_submission(submission)
      puts "#{index + 1}/#{submissions_count} (#{submission['id']}) > out/#{combined_pdf_file_name}"
    end
  end
end
