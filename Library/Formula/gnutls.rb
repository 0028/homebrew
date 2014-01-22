require 'formula'

class Gnutls < Formula
  homepage 'http://gnutls.org'
  url 'ftp://ftp.gnutls.org/gcrypt/gnutls/v3.1/gnutls-3.1.18.tar.xz'
  bottle do
    cellar :any
    sha1 "5d0c1a8bddc31cd4ff5751fae2b2e364a4383cd3" => :mavericks
    sha1 "92cbf437150ec2c3a7fa85bda20daa309f0c73eb" => :mountain_lion
    sha1 "51f42d91d773e9331637d9fbb102ce3c8673c3c5" => :lion
  end

  mirror 'http://mirrors.dotsrc.org/gcrypt/gnutls/v3.1/gnutls-3.1.18.tar.xz'
  sha1 '360cdb86c1bb6494c27901b5d4c8815b37d5bd4c'

  depends_on 'xz' => :build
  depends_on 'pkg-config' => :build
  depends_on 'libtasn1' => :recommended
  depends_on 'p11-kit' => :recommended
  depends_on 'nettle'
  depends_on 'guile' => :optional

  fails_with :llvm do
    build 2326
    cause "Undefined symbols when linking"
  end

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-static
      --prefix=#{prefix}
    ]

    if build.with? 'guile'
      args << '--enable-guile'
      args << '--with-guile-site-dir=no'
    end

    system "./configure", *args
    system "make install"

    # certtool shadows the OS X certtool utility
    mv bin+'certtool', bin+'gnutls-certtool'
    mv man1+'certtool.1', man1+'gnutls-certtool.1'
  end
end
