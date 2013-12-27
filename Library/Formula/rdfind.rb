require 'formula'

class Rdfind < Formula
  homepage 'http://rdfind.pauldreik.se'
  url 'http://rdfind.pauldreik.se/rdfind-1.3.4.tar.gz'
  sha1 'c01bd2910cdec885b6c24164a389457e4f01ef61'

  bottle do
    cellar :any
    sha1 '6fdbf2f11e2e1c42ea25b331326da2d4e8be5a27' => :mavericks
    sha1 'd39c1fc940688c03cb2444a236a34c619e55d0f0' => :mountain_lion
    sha1 '467eeb494b7ee6c40fd78182625d4da9837eb2db' => :lion
  end

  depends_on 'nettle'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    mkdir 'folder'
    touch 'folder/file1'
    touch 'folder/file2'
    system "#{bin}/rdfind -deleteduplicates true -ignoreempty false folder"
    File.exist?('folder/file1')==true
    File.exist?('folder/file2')==false
  end
end
