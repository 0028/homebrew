require 'formula'

class Libmicrohttpd < Formula
  homepage 'http://www.gnu.org/software/libmicrohttpd/'
  url 'http://ftpmirror.gnu.org/libmicrohttpd/libmicrohttpd-0.9.33.tar.gz'
  bottle do
    cellar :any
    sha1 'de5a562884a1ba54805bbd12e3a83c3e3de14a3d' => :mavericks
    sha1 '8ce6bce706cc450328d9c604c648ff59af4fac5a' => :mountain_lion
    sha1 '3666a7174496884253e0b1160bcd361396455d2f' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.33.tar.gz'
  sha1 '75f53089ba86b5aa4e4eeb2579c47fed6ca63c72'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
