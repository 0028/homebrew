require 'formula'

class Stormfs < Formula
  homepage 'https://github.com/benlemasurier/stormfs'
  url 'https://github.com/benlemasurier/stormfs/archive/v0.03.tar.gz'
  sha1 'bae7aeb409b910dd3844cd930f3ad9427d7e1609'

  bottle do
    sha1 "11bc05d4a1943f5eb68dde2828cadde8da76a9c2" => :mavericks
    sha1 "47966b2e8ad3c812c19ffab26beafd69cf8c9925" => :mountain_lion
    sha1 "5c4c528ef0e8aca85c8699892f16677b05dd995a" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on :autoconf
  depends_on :automake
  depends_on 'glib'
  depends_on 'fuse4x'
  depends_on 'curl' if MacOS.version <= :leopard

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
