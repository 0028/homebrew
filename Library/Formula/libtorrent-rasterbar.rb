require 'formula'

class LibtorrentRasterbar < Formula
  homepage 'http://www.rasterbar.com/products/libtorrent/'
  url 'https://libtorrent.googlecode.com/files/libtorrent-rasterbar-0.16.12.tar.gz'
  sha1 'cd326fd2609c3d00c25dabdd441a0704efbf0207'

  bottle do
    cellar :any
    sha1 '1723559dbe2497e6b829acf08d941cf69a2f9888' => :mavericks
    sha1 '80555f20efafc9581e464c53ea5ab2680a0c3a97' => :mountain_lion
    sha1 'a900178f991afc4d15cd32a7517c1f5d57236392' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'boost'
  depends_on 'openssl' if MacOS.version <= :snow_leopard # Needs a newer version of OpenSSL on Snow Leopard

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
