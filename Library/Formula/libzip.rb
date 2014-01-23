require 'formula'

class Libzip < Formula
  homepage 'http://www.nih.at/libzip/'
  url 'http://www.nih.at/libzip/libzip-0.11.2.tar.gz'
  sha1 'eeb3b5567fcf3532fa4bcb6440a87c7ad8507d2d'

  bottle do
    cellar :any
    sha1 "02f3cf624ce336ca3911fc3dd4db68113828b047" => :mavericks
    sha1 "2701c02ab3427d415707d62c1e9acfdba94ffdb6" => :mountain_lion
    sha1 "c9406e42c2c75d37bd4569004dc77199bd9b0861" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "CXX=#{ENV.cxx}",
                          "CXXFLAGS=#{ENV.cflags}"
    system "make install"
  end
end
