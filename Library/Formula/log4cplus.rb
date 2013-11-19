require 'formula'

class Log4cplus < Formula
  homepage 'http://log4cplus.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/1.1.2/log4cplus-1.1.2.tar.bz2'
  sha1 '39caf65f9aaaed3698dcc239a2fa26f1f90952c9'

  bottle do
    cellar :any
    sha1 'e26f8a847059966c7f8e8e5b02920724dc3ba815' => :mavericks
    sha1 'daccb011907a8674c1d1926301db87a7f1024d20' => :mountain_lion
    sha1 '6b03899554702493c597ed788ecc6c9d0fc1176e' => :lion
  end

  option :cxx11

  def install
    ENV.cxx11 if build.cxx11?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
