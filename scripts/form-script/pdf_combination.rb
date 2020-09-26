# typed: strict

class PDFCombination
  extend T::Sig

  sig {params(out_pdf_path: String, in_pdf_paths: String).void}
  def initialize(out_pdf_path, *in_pdf_paths)
    @out_pdf_path = T.let(out_pdf_path, String)
    @in_pdf_paths = T.let(in_pdf_paths, T::Array[String])
  end

  sig {returns(T.nilable(T::Boolean))}
  def combine!
    system("\"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py\" -o #{out_pdf_path} #{in_pdf_paths.join(' ')}")
  end

  sig {returns(String)}
  attr_reader :out_pdf_path

  sig {returns(T::Array[String])}
  attr_reader :in_pdf_paths
end
