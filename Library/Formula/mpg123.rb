require 'formula'

class Mpg123 < Formula
  homepage 'http://www.mpg123.de/'
  url 'https://downloads.sourceforge.net/project/mpg123/mpg123/1.19.0/mpg123-1.19.0.tar.bz2'
  bottle do
    cellar :any
    sha1 "247263831e64a21d3b0d225314b3705980b2b2be" => :mavericks
    sha1 "279211f6ea86e23eaee378e5c8e2b7e727faca71" => :mountain_lion
    sha1 "8400312e27424bed19026216a684cda7b169eebc" => :lion
  end

  mirror 'http://mpg123.orgis.org/download/mpg123-1.18.0.tar.bz2'
  sha1 '835f8ae489b41ae69fa8c76a0b1e5ee5495ef0ae'

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
