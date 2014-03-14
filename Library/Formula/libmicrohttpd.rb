require 'formula'

class Libmicrohttpd < Formula
  homepage 'http://www.gnu.org/software/libmicrohttpd/'
  url 'http://ftpmirror.gnu.org/libmicrohttpd/libmicrohttpd-0.9.34.tar.gz'
  bottle do
    cellar :any
    sha1 "fe426d86fe5aabdd4075f30a033b1f351b3fa23f" => :mavericks
    sha1 "d72811f8eb09192e9cac5e6ab8f681db5e49b23a" => :mountain_lion
    sha1 "713afba364ddc52f017714aee71753d4cbd09458" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.34.tar.gz'
  sha1 '1122f26fa278556630aaef40a500a9be19bdcfc9'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
