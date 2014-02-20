require 'formula'

class Yaz < Formula
  homepage 'http://www.indexdata.com/yaz'
  url 'http://ftp.indexdata.dk/pub/yaz/yaz-5.0.14.tar.gz'
  sha1 'a599f37cbbb91703c934f0207a346dd3a1cf9a5a'

  bottle do
    cellar :any
    sha1 "ff20ab9af76607f9d91ae77de5699e560e48d65f" => :mavericks
    sha1 "7632cd9a8488605391e7a192e01314c4223efec1" => :mountain_lion
    sha1 "4dfaa6f3a2589e05cb811fb832577e849753402b" => :lion
  end

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-xml2"
    system "make install"
  end
end
