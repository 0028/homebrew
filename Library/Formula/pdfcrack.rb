require 'formula'

class Pdfcrack < Formula
  homepage 'http://pdfcrack.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/pdfcrack/pdfcrack/pdfcrack-0.13/pdfcrack-0.13.tar.gz'
  sha1 'fd5d99bd5a1edb3885219f84da718e329f899843'

  bottle do
    cellar :any
    sha1 "34168afa05482164d621b37b67b7938cca7986f5" => :mavericks
    sha1 "76a128d9b0893b18c3c6b7889883d5e4d5cce378" => :mountain_lion
    sha1 "fe9c04419eb9d899b89e1e8b47665b5753694f3b" => :lion
  end

  def install
    system "make all"
    bin.install "pdfcrack"
  end
end
