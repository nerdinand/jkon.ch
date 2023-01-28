# frozen_string_literal: true

# typed: strict

# Downloads an attachment of a submission
class AttachmentDownload
  extend T::Sig

  sig { params(submission_id: String, url: String, file_name: String).void }
  def initialize(submission_id, url, file_name)
    @submission_id = T.let(submission_id, String)
    @url = T.let(url, String)
    @file_name = T.let(file_name, String)
  end

  sig { returns(String) }
  def download!
    system("curl -L -s \"#{url}\" > #{write_path}")
    write_path
  end

  private

  sig { returns(String) }
  attr_reader :submission_id

  sig { returns(String) }
  attr_reader :url

  sig { returns(String) }
  attr_reader :file_name

  sig { returns(String) }
  def write_path
    "tmp/#{submission_id}/#{file_name}"
  end
end
