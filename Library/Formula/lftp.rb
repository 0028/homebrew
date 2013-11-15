require 'formula'

class Lftp < Formula
  homepage 'http://lftp.yar.ru/'
  url 'http://lftp.yar.ru/ftp/lftp-4.4.11.tar.bz2'
  bottle do
    sha1 '9c5613bd33241625f461cbc4b1a580d68f34909f' => :mavericks
    sha1 '2ce8a145c56269859765259ce9ba08e93540656b' => :mountain_lion
    sha1 'df05499dc34f9a779e4933a636c1ca6ba6ef3130' => :lion
  end

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
