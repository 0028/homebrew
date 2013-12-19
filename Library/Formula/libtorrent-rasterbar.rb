require 'formula'

class LibtorrentRasterbar < Formula
  homepage 'http://www.rasterbar.com/products/libtorrent/'
  url 'https://libtorrent.googlecode.com/files/libtorrent-rasterbar-0.16.13.tar.gz'
  sha1 '93a2098d77e9f36ff99966311be1e6cbb131e70f'

  bottle do
    cellar :any
    sha1 '4fe37523c3c4d8dcd378e72360a129fcef549d7d' => :mavericks
    sha1 'f16e4f5fedb07fdd4a7290a8e4d924117d56aaff' => :mountain_lion
    sha1 '4a7e0f96c46548cc6dc94e936a802ed46f7b16f2' => :lion
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
