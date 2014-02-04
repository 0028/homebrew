require 'formula'

class SimpleTiles < Formula
  homepage 'http://propublica.github.io/simple-tiles/'
  url 'https://github.com/propublica/simple-tiles/archive/v0.4.0.tar.gz'
  sha1 '7ab95f5bd697ac00e8a5406e26007dc717734209'

  head 'https://github.com/propublica/simple-tiles.git'

  bottle do
    cellar :any
    sha1 "3a8eb351023f49b9081d3f00a25a21a9388c5d04" => :mavericks
    sha1 "5a10b428e64755b6b1bd5f4cebc8e4b60b7543ba" => :mountain_lion
    sha1 "081c9084831cc3e58f5e7a684c57f3f5fc0fef39" => :lion
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
