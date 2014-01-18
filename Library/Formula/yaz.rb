require 'formula'

class Yaz < Formula
  homepage 'http://www.indexdata.com/yaz'
  url 'http://ftp.indexdata.dk/pub/yaz/yaz-5.0.11.tar.gz'
  sha1 'a7606a281d6e9454797789ce36a9ae39aba66634'

  bottle do
    cellar :any
    sha1 'fc6053b771c88de2ce0550c0fd95415e2336382e' => :mavericks
    sha1 'c455442eae3a1ef0e920a5fa0609073b686eb69e' => :mountain_lion
    sha1 '7297aabb2e710ea81f2865f70dd21a94885e0fdf' => :lion
  end

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-xml2"
    system "make install"
  end
end
