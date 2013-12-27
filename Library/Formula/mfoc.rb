require 'formula'

class Mfoc < Formula
  homepage 'http://code.google.com/p/mfoc/'
  url 'http://mfoc.googlecode.com/files/mfoc-0.10.7.tar.bz2'
  sha1 '162a464baf6498926a72383c6b0040654321012d'
  bottle do
    cellar :any
    sha1 '035dfb2c3d71fc4fb510552491390b6952ed2429' => :mavericks
    sha1 'fa907a1bce31d13343f61c9bbf2af54ddfca46c4' => :mountain_lion
    sha1 '40749a8d9854832ff7382e0c9a32e972f483a0f8' => :lion
  end

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
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
