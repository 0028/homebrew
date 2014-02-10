require 'formula'

class SimpleTiles < Formula
  homepage 'http://propublica.github.io/simple-tiles/'
  url 'https://github.com/propublica/simple-tiles/archive/v0.4.1.tar.gz'
  sha1 'fae2f115bf99e725f8fe38dc011718ec1364ed6f'

  head 'https://github.com/propublica/simple-tiles.git'

  bottle do
    cellar :any
    sha1 "8a7ed3da25913ddf22742c34783924dddb23120d" => :mavericks
    sha1 "1320eaa2fa33fe6cbda357c4f42bc3bee6227655" => :mountain_lion
    sha1 "3ca93459c2d71ba32bc4d0d7cccfa7a26372446e" => :lion
  end

  depends_on "pkg-config" => :build
  depends_on "cairo"
  depends_on "gdal"
  depends_on "pango"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
