require 'formula'

class Pdftoipe < Formula
  homepage 'http://ipe7.sourceforge.net/'
  url 'http://sourceforge.net/projects/ipe7/files/tools/pdftoipe-20130124-src.tar.gz'
  sha1 '081141129f9a2c55e6732e597fd8e94cc96f69e3'

  bottle do
    cellar :any
    sha1 'fe32d9615dda39c6cb273ecf306e4d4642ebcc43' => :mavericks
    sha1 'acad2996181f60d988f21d0fb6125865643bc634' => :mountain_lion
    sha1 '9408537ba612a21e523a6cff9e31b34ca8b0c5ad' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'poppler'

  def install
    system "make"
    bin.install "pdftoipe"
    man1.install "pdftoipe.1"
    doc.install "readme.txt"
  end
end
