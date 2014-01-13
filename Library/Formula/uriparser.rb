require 'formula'

class Uriparser < Formula
  homepage 'http://uriparser.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/uriparser/Sources/0.8.0/uriparser-0.8.0.tar.bz2'
  sha1 '4bfe347220b00ff9cd3252e2b784d13e583282fb'

  bottle do
    cellar :any
    sha1 'e326421a34e63d8e0cd59ce4c607e6da30ae9947' => :mavericks
    sha1 'f5567c73ca43b31cf03413bdcd6555bc48c226d1' => :mountain_lion
    sha1 '5eebaf622ff6e628f2643ce0c97267fcf15bac0e' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'cpptest'

  conflicts_with 'libkml', :because => 'both install `liburiparser.dylib`'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-doc"
    system "make check"
    system "make install"
  end
end
