require 'formula'

class LibtorrentRasterbar < Formula
  homepage 'http://www.rasterbar.com/products/libtorrent/'
  url 'https://downloads.sourceforge.net/project/libtorrent/libtorrent/libtorrent-rasterbar-0.16.15.tar.gz'
  sha1 '8657a493fb2ee4e6bf55e484deb922d23b65818d'

  bottle do
    cellar :any
    sha1 "c92dca54a2cf83e3975936371c052f8b8b5c0e5b" => :mavericks
    sha1 "0443d25a31e7fc6d1f858203f1ebcf3c0b8c8422" => :mountain_lion
    sha1 "363d2e8b0534c30ffa8d24a709705b9998ff1021" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'boost'
  depends_on 'openssl' if MacOS.version <= :snow_leopard # Needs a newer version of OpenSSL on Snow Leopard

  def install
    boost = Formula["boost"]
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-boost=#{boost.opt_prefix}"
    system "make install"
  end
end
