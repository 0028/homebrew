require 'formula'

# Xcode 4.3 provides the Apple libtool.
# This is not the same so as a result we must install this as glibtool.

class Libtool < Formula
  homepage 'http://www.gnu.org/software/libtool/'
  url 'http://ftpmirror.gnu.org/libtool/libtool-2.4.2.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz'
  sha1 '22b71a8b5ce3ad86e1094e7285981cae10e6ff88'

  bottle do
    revision 2
    sha1 'a601003a4d407ae555e2337ef080a4852a2ca071' => :mavericks
    sha1 '131c9d4af7d83b9dc8b6efe8ba36554472b512b5' => :mountain_lion
    sha1 'b3c104beff531294fd5bc9419293abd5d24c5c97' => :lion
  end

  if MacOS::Xcode.provides_autotools? or File.file? "/usr/bin/glibtoolize"
    keg_only "Xcode 4.2 and below provide glibtool."
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--program-prefix=g",
                          "--enable-ltdl-install"
    system "make install"
  end

  def caveats; <<-EOS.undent
    In order to prevent conflicts with Apple's own libtool we have prepended a "g"
    so, you have instead: glibtool and glibtoolize.
    EOS
  end

  test do
    system "#{bin}/glibtool", 'execute', '/usr/bin/true'
  end
end
