require 'formula'

class Recutils < Formula
  homepage 'http://www.gnu.org/software/recutils/'
  url 'http://ftpmirror.gnu.org/recutils/recutils-1.7.tar.gz'
  bottle do
    cellar :any
    sha1 "ac881d0cb3162f45f5d2e44515c445e9cc233f3a" => :mavericks
    sha1 "d395089be898ce21cd410e6d405b5da22dd355d6" => :mountain_lion
    sha1 "63a19f9ca9cfa2e16165aa1a49c9c188e9e353c6" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/recutils/recutils-1.7.tar.gz'
  sha1 '20d265aecb05ca4e4072df9cfac08b1392da6919'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
