require 'formula'

class Freexl < Formula
  homepage 'https://www.gaia-gis.it/fossil/freexl/index'
  url 'http://www.gaia-gis.it/gaia-sins/freexl-1.0.0g.tar.gz'
  sha1 '2a5b1d3ebbaf217c7bda15b5b3f1e0222c6c1502'

  bottle do
    cellar :any
    sha1 '73e1a87bc64605222c94dd96c5cc037ae0f83ac1' => :mavericks
    sha1 '4f8794d3012df5dce2e276be804e18402c50cab9' => :mountain_lion
    sha1 '3fab54106642e1d385da846923d64687c32d623b' => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
