require 'formula'

class Spdylay < Formula
  homepage 'https://github.com/tatsuhiro-t/spdylay'
  url 'https://github.com/tatsuhiro-t/spdylay/archive/v1.2.2.tar.gz'
  sha1 '04f0e65161ab63b48bf101ed100bf6575eec73f7'

  bottle do
    cellar :any
    sha1 '11d723d5629481572f19c07c10a373c5d05978ed' => :mavericks
    sha1 '5458b9dcfcf7ae4b8caa7cbb2c7a6fc11f430479' => :mountain_lion
    sha1 'de40c6792363b866982a664068b6bbc1658be126' => :lion
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
