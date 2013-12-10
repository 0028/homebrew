require 'formula'

class Dar < Formula
  homepage 'http://dar.linux.free.fr/doc/index.html'
  url 'http://downloads.sourceforge.net/project/dar/dar/2.4.11/dar-2.4.11.tar.gz'
  sha1 '02c6257dca054fecbee1e7bcd91ce525f986a67d'

  bottle do
    sha1 'cf14dc9562fc99cc0b3b0ac3eebb4ad129cbf035' => :mavericks
    sha1 '1c48accd5c1ae0719d09628a132090820357de5b' => :mountain_lion
    sha1 '700612ede36baf441b264f7b278ef4ea036d3ca3' => :lion
  end

  depends_on 'gettext'

  def patches
    [
      "https://sourceforge.net/p/dar/patches/32/attachment/osx_10.9_compat.patch",
    ]
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-build-html"
    system "make install"
  end
end
