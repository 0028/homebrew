require 'formula'

class Libzip < Formula
  homepage 'http://www.nih.at/libzip/'
  url 'http://www.nih.at/libzip/libzip-0.11.2.tar.gz'
  sha1 'eeb3b5567fcf3532fa4bcb6440a87c7ad8507d2d'

  bottle do
    cellar :any
    sha1 '396a1d0a3e36a77ad1d1b6dff0495e5d0c13bcd4' => :mavericks
    sha1 '4c8617897ed1d8eca0343c3254318675c9ef6466' => :mountain_lion
    sha1 '3023f3febe58dd693f1c5205004bfc1146b4b39e' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "CXX=#{ENV.cxx}",
                          "CXXFLAGS=#{ENV.cflags}"
    system "make install"
  end
end
