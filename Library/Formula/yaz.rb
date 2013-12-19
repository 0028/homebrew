require 'formula'

class Yaz < Formula
  homepage 'http://www.indexdata.com/yaz'
  url 'http://ftp.indexdata.dk/pub/yaz/yaz-5.0.7.tar.gz'
  sha1 '72585ba2cb3e9bc30846bac473a8113433d69758'

  bottle do
    cellar :any
    sha1 '52ca3d10cd876e431df0954ce91811364385f267' => :mavericks
    sha1 '5a75ec0e2b82f91b285c710c44253880b7eb172b' => :mountain_lion
    sha1 '7a41de5212d83115ff8b5ee02f16a0512f935844' => :lion
  end

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-xml2"
    system "make install"
  end
end
