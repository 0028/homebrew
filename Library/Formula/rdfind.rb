require 'formula'

class Rdfind < Formula
  homepage 'http://rdfind.pauldreik.se'
  url 'http://rdfind.pauldreik.se/rdfind-1.3.4.tar.gz'
  sha1 'c01bd2910cdec885b6c24164a389457e4f01ef61'

  bottle do
    cellar :any
    sha1 "7e7c7bafb383efba0a9ae54d297641a4ae2799c3" => :mavericks
    sha1 "f3f225c5f639ac123d3c67284f17cbe01f4c9fc6" => :mountain_lion
    sha1 "752b0fa9c71ab9de53e2df6085c63a8616e7c2ac" => :lion
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
    assert File.exist?('folder/file1')
    assert !File.exist?('folder/file2')
  end
end
