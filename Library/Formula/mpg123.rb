require 'formula'

class Mpg123 < Formula
  homepage 'http://www.mpg123.de/'
  url 'http://downloads.sourceforge.net/project/mpg123/mpg123/1.17.0/mpg123-1.17.0.tar.bz2'
  bottle do
    cellar :any
    sha1 'b2144c8dc96d4ab1b2cd6a0edc10f8e5054cd3e8' => :mavericks
    sha1 '200769b6b2c2c40db56ae2d2d25d66e5c1551138' => :mountain_lion
    sha1 '46f3f1a3c4d0158dea2c6fa2254a2955e36cf21d' => :lion
  end

  mirror 'http://mpg123.orgis.org/download/mpg123-1.17.0.tar.bz2'
  sha1 '8185f06ab94651adb2fc7a1ab860f0fd154b6f80'

  def install
    args = ["--disable-debug", "--disable-dependency-tracking",
            "--prefix=#{prefix}",
            '--with-default-audio=coreaudio',
            '--with-module-suffix=.so']

    if MacOS.prefer_64_bit?
      args << "--with-cpu=x86-64"
    else
      args << "--with-cpu=sse_alone"
    end

    system "./configure", *args
    system "make install"
  end
end
