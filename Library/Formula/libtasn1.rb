require 'formula'

class Libtasn1 < Formula
  homepage 'http://www.gnu.org/software/libtasn1/'
  url 'http://ftpmirror.gnu.org/libtasn1/libtasn1-3.4.tar.gz'
  bottle do
    cellar :any
    sha1 '18735144aefb4a1702c7a76f23ca0b154e7f642e' => :mavericks
    sha1 '2c0367afc00f7a8b7f539ee6f795fa695d75267b' => :mountain_lion
    sha1 'b9b880201486608670707fab232c2c891836c544' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/libtasn1/libtasn1-3.4.tar.gz'
  sha1 'f0e95f58b3c37405d48b91a585b517a4134586a9'

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
