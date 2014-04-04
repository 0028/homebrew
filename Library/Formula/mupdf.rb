require 'formula'

class Mupdf < Formula
  homepage 'http://mupdf.com'
  url 'https://mupdf.googlecode.com/files/mupdf-1.3-source.tar.gz'
  sha1 '082325aceb5565b07b82c2b6cc52a97533e03cf9'
  bottle do
    cellar :any
    sha1 "ecc27a429023375ff84072ac688844a4f673e7bf" => :mavericks
    sha1 "b5bfcc0e07686894c176524e0086df3dff035da0" => :mountain_lion
    sha1 "84d3383690082690d2c5952aff72b3eadc69213b" => :lion
  end

  revision 1

  depends_on :macos => :snow_leopard
  depends_on :x11

  def install
    system "make", "install", "build=release", "prefix=#{prefix}"
  end
end
