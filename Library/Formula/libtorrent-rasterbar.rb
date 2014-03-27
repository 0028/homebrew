require 'formula'

class LibtorrentRasterbar < Formula
  homepage 'http://www.rasterbar.com/products/libtorrent/'
  url 'https://downloads.sourceforge.net/project/libtorrent/libtorrent/libtorrent-rasterbar-0.16.15.tar.gz'
  sha1 '8657a493fb2ee4e6bf55e484deb922d23b65818d'

  bottle do
    cellar :any
    sha1 "c4de75d97ec3da5cffd79c04adeefdabb2e27de8" => :mavericks
    sha1 "d129e53d4615eaf41c812a940531fd790ef4ae32" => :mountain_lion
    sha1 "8ee6f66422ce0bf32c503f374320369b8d12b850" => :lion
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
