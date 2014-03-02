require 'formula'

class Libpng < Formula
  homepage 'http://www.libpng.org/pub/png/libpng.html'
  url 'http://sourceforge.net/projects/libpng/files/libpng15/older-releases/1.5.17/libpng-1.5.17.tar.bz2'
  sha1 '899d660104f3ef5c349c57faad10844b388f8442'

  bottle do
    cellar :any
    revision 2
    sha1 "9fdb8ef895aab145eb64fc8ae4927231ff51d470" => :mavericks
    sha1 "5a1a9a4488219b9283a0031cc6b0d59507966e14" => :mountain_lion
    sha1 "8d15dc207d39096e5ac63fe0739959fe7d14e517" => :lion
  end

  keg_only :provided_pre_mountain_lion

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
