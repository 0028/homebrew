require 'formula'

class Lftp < Formula
  homepage 'http://lftp.yar.ru/'
  url 'http://lftp.yar.ru/ftp/lftp-4.4.11.tar.bz2'
  mirror 'ftp://ftp.cs.tu-berlin.de/pub/net/ftp/lftp/lftp-4.4.11.tar.bz2'
  sha1 '56cefb9aa683acfa5c5713d530f594085ea7b149'

  option 'with-openssl', "Use OpenSSL instead of the default GnuTLS"
  depends_on 'pkg-config' => :build
  depends_on 'readline'
  depends_on 'gnutls' if build.without? 'openssl'

  def install
    # Bus error
    # TODO what are the more specific circumstances?
    ENV.no_optimization if MacOS.version <= :leopard

    args = ["--disable-dependency-tracking",
            "--prefix=#{prefix}"]
    args << "--with-openssl" if build.with? 'openssl'
    system "./configure", *args
    system "make install"
  end
end
