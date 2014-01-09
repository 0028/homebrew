require 'formula'

class Aria2 < Formula
  homepage 'http://aria2.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/aria2/stable/aria2-1.18.2/aria2-1.18.2.tar.bz2'
  sha1 '2f04a17567e6b793420a517b3fb0511f12c76289'

  bottle do
    cellar :any
    sha1 '26dcb9805d693aa8973ffe1cf9e945d0c9351a0c' => :mavericks
    sha1 '8fc2150e1bee6685f3d0e81400a356bcc908a38f' => :mountain_lion
    sha1 '5147b1d2a4fc8e10c090dd8bcdc68c070654ab1c' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'sqlite' => :build # required for --with-sqlite3 to support Chrome cookies
  depends_on :macos => :lion # Needs a c++11 compiler

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-appletls
      --without-openssl
      --without-gnutls
      --without-libgmp
      --without-libnettle
      --without-libgcrypt
      --with-sqlite3
    ]

    ENV['ZLIB_CFLAGS'] = '-I/usr/include'
    ENV['ZLIB_LIBS'] = '-L/usr/lib -lz'

    system "./configure", *args
    system "make install"

    bash_completion.install "doc/bash_completion/aria2c"
  end
end
