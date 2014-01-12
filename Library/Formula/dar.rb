require 'formula'

class Dar < Formula
  homepage 'http://dar.linux.free.fr/doc/index.html'
  url 'http://downloads.sourceforge.net/project/dar/dar/2.4.11/dar-2.4.11.tar.gz'
  sha1 '02c6257dca054fecbee1e7bcd91ce525f986a67d'

  bottle do
    sha1 '75e6a51d5de2172a3e9699edc7674bd5cd14b1b0' => :mavericks
    sha1 '4326b9ed6e816ea34707afe49536b84e0044d3e2' => :mountain_lion
    sha1 'f3586829a1c6c643113b799499e64ddc0755dd31' => :lion
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
