require 'formula'

class Lightning < Formula
  homepage 'http://www.gnu.org/software/lightning/'
  url 'http://ftpmirror.gnu.org/lightning/lightning-2.0.4.tar.gz'
  bottle do
    cellar :any
    sha1 "8be986dab8b7bc4c5db694819989383355b0ffdd" => :mavericks
    sha1 "8474c7e15696f67f42ca014f109ae30915480ee4" => :mountain_lion
    sha1 "21f55de2d38dd91cbd094db0743e5e333a8027b3" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/lightning/lightning-2.0.4.tar.gz'
  sha1 '06982b859dd2322d5bd9e52e0aacebe741a98e6e'

  def install
    system "./configure","--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
