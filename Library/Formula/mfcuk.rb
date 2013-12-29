require 'formula'

class Mfcuk < Formula
  homepage 'http://code.google.com/p/mfcuk/'
  url 'http://mfcuk.googlecode.com/files/mfcuk-0.3.8.tar.gz'
  sha1 '2a8259440ac5bed8516c8d771a945b713dacd2bc'

  bottle do
    cellar :any
    sha1 '0588f2b0f9978f98c6ef41bf83315044aafe2284' => :mavericks
    sha1 'a606e641e2541c714665d4ecc8ff70e20ff67861' => :mountain_lion
    sha1 'eb4fed33ab4cf01c9b6f592d62e4301ebadcb77e' => :lion
  end

  depends_on :automake
  depends_on :autoconf
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
