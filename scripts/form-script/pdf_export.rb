# typed: strict

require 'wicked_pdf'
require 'fileutils'

class PDFExport
  extend T::Sig

  TITLE_FIELD = T.let('name', String)

  TEXT_FIELDS = T.let(%w[
    id
    address
    birth_date
    phone
    email
    curriculum_vitae
    website
    instagram_handle
  ], T::Array[String])

  sig {params(submission: Submission).void}
  def initialize(submission)
    @submission = T.let(submission, Submission)
  end

  sig {returns(Integer)}
  def export!
    FileUtils.mkdir_p(submission.id)

    File.write(
      submission.id + '/' + pdf_file_name,
      WickedPdf.new.pdf_from_string(html_source)
    )
  end

  sig {returns(String)}
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
      "<img src=\"#{submission.portraitneutraler}\" style=\"max-width: 900px; max-height: 1400px;\"/>" +
    '</body>' +
    '</html>'
  end

  private

  sig {returns(String)}
  def pdf_file_name
    'summary.pdf'
  end

  sig {returns(Submission)}
  attr_reader :submission
end
