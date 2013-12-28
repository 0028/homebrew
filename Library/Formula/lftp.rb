require 'formula'

class Lftp < Formula
  homepage 'http://lftp.yar.ru/'
  url 'http://lftp.yar.ru/ftp/lftp-4.4.14.tar.bz2'
  sha1 'f34cfc0351f8e63a066cf8014ac32a52f5159434'

  bottle do
    sha1 '6a436e04c79c7b7fc458b3d46f59d3442e8a26af' => :mavericks
    sha1 '33914c1417df6b288765b971de3c8e799f55882d' => :mountain_lion
    sha1 '784a42a38b582b703bcf066dadb5e4f10082ef43' => :lion
  end

  option 'with-gnutls', "Use GnuTLS instead of the default OpenSSL"
  option 'with-brewed-openssl', 'Build with Homebrew OpenSSL instead of the system version'

  depends_on 'pkg-config' => :build
  depends_on 'readline'
  depends_on 'gnutls' => :optional
  depends_on 'openssl' if build.with? 'brewed-openssl'

  def install
    # Bus error
    # TODO what are the more specific circumstances?
    ENV.no_optimization if MacOS.version <= :leopard

    args = ["--disable-dependency-tracking",
            "--prefix=#{prefix}"]
    if build.with? 'gnutls'
     args << "--with-gnutls"
    else
     args << "--with-openssl"
    end
    system "./configure", *args
    system "make install"
  end
end
