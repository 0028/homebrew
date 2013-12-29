require 'formula'

class Mfoc < Formula
  homepage 'http://code.google.com/p/mfoc/'
  url 'http://mfoc.googlecode.com/files/mfoc-0.10.7.tar.bz2'
  sha1 '162a464baf6498926a72383c6b0040654321012d'

  bottle do
    cellar :any
    sha1 '448e72aee781a83dd519f379c7f00e9d77ddf49a' => :mavericks
    sha1 '5e0fa6552783d899a7651891f1a678d803914de7' => :mountain_lion
    sha1 '7e7f86e3afea7632428334ad0a3aafd5138b1602' => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on 'pkg-config' => :build
  depends_on 'libnfc'
  depends_on 'libusb'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "mfoc", "-h"
  end
end
