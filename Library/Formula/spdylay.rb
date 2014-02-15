require 'formula'

class Spdylay < Formula
  homepage 'https://github.com/tatsuhiro-t/spdylay'
  url 'https://github.com/tatsuhiro-t/spdylay/archive/v1.2.3.tar.gz'
  sha1 '96a04068ca0b5df10e37f8d60379b2cb9c5f67d6'

  bottle do
    cellar :any
    sha1 "b4ea51a408cc7bfd8fce296a10bff2494a1b5ba3" => :mavericks
    sha1 "66efafe445a919b0de1d780e5fcb8798dd918eda" => :mountain_lion
    sha1 "11bc3a716e25a11b6548a87195cebfc3e7a8221b" => :lion
  end

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'libxml2'
  depends_on 'openssl'

  def install
    system 'autoreconf -i'
    system 'automake'
    system 'autoconf'

    ENV['ZLIB_CFLAGS'] = '-I/usr/include'
    ENV['ZLIB_LIBS'] = '-L/usr/lib -lz'

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/spdycat", "-ns", "https://www.google.com"
  end
end
