require 'formula'

class Freexl < Formula
  homepage 'https://www.gaia-gis.it/fossil/freexl/index'
  url 'http://www.gaia-gis.it/gaia-sins/freexl-sources/freexl-1.0.0f.tar.gz'
  sha1 '2c4b2184b68126552b395a0d2f6a386722334459'

  bottle do
    cellar :any
    sha1 '372031294fc2bbdfa1821d939f7cfcd80c4e9bef' => :mavericks
    sha1 '822740a7ba2140f4644bab9161ad1d42972e2e86' => :mountain_lion
    sha1 '10282fe584a662f9632e5930f980732bd7130f33' => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
