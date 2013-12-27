require 'formula'

class Mfcuk < Formula
  homepage 'http://code.google.com/p/mfcuk/'
  url 'http://mfcuk.googlecode.com/files/mfcuk-0.3.8.tar.gz'
  sha1 '2a8259440ac5bed8516c8d771a945b713dacd2bc'

  bottle do
    cellar :any
    sha1 '9453c673dd378c0e47a69d67b9df6ec17a3ec2ed' => :mavericks
    sha1 '7e58cdcf1fa2dd1bfb505f922c95552e0e88ec2a' => :mountain_lion
    sha1 'f2d6db878cf655598caf8c0c57b7c81a726acd3f' => :lion
  end

  depends_on 'automake' => :build
  depends_on 'autoconf' => :build
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
    system "mfcuk", "-h"
  end
end
