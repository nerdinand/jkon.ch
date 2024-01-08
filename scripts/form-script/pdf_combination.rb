# frozen_string_literal: true

# typed: strict

# Combines multiple PDFs using an Automator script
class PDFCombination
  extend T::Sig

  sig { params(out_pdf_path: String, in_pdf_paths: T::Array[String]).void }
  def initialize(out_pdf_path, in_pdf_paths)
    @out_pdf_path = T.let(out_pdf_path, String)
    @in_pdf_paths = T.let(in_pdf_paths, T::Array[String])
  end

  sig { returns(T.nilable(T::Boolean)) }
  def combine!
    cmd = "\"/System/Library/Automator/Combine PDF Pages.action/Contents/MacOS/join\" \
    -o #{out_pdf_path} #{in_pdf_paths.join(' ')}"
    system(cmd)
  end

  sig { returns(String) }
  attr_reader :out_pdf_path

  sig { returns(T::Array[String]) }
  def in_pdf_paths
    @in_pdf_paths.select do |path|
      File.exist?(path) && !File.empty?(path)
    end
  end
end
