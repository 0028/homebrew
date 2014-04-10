require 'formula'

class LibtorrentRasterbar < Formula
  homepage 'http://www.rasterbar.com/products/libtorrent/'
  url 'https://downloads.sourceforge.net/project/libtorrent/libtorrent/libtorrent-rasterbar-0.16.16.tar.gz'
  sha1 'de8faed5cbc09baddb2748cb7b75edd07ab0addc'

  bottle do
    cellar :any
    sha1 "7545ed9f3aab887ce711e532f519ffc46289782f" => :mavericks
    sha1 "56b52529f8432410a082771d16b2233e6fa5a859" => :mountain_lion
    sha1 "5c338e3a35f2202cc2fea73a8605603529493237" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'boost'
  depends_on 'openssl' if MacOS.version <= :snow_leopard # Needs a newer version of OpenSSL on Snow Leopard
  depends_on :python => :recommended

  def install
    boost = Formula["boost"]

    args = [ "--disable-debug",
             "--disable-dependency-tracking",
             "--prefix=#{prefix}",
             "--with-boost=#{boost.opt_prefix}" ]

    # Build python bindings requires forcing usage of the mt version of boost_python.
    # Be aware that if using a brewed python, boost will have to be built from source
    # to ensure that boost_python is linked against the brewed python runtime.
    if build.with? "python"
      args << "--enable-python-binding"
      args << "--with-boost-python=boost_python-mt"
      args << "PYTHON_EXTRA_LDFLAGS= "
    end

    system "./configure", *args
    system "make install"
  end
end
