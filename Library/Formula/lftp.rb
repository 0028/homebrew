require 'formula'

class Lftp < Formula
  homepage 'http://lftp.yar.ru/'
  url 'http://lftp.yar.ru/ftp/lftp-4.4.13.tar.bz2'
  bottle do
    sha1 '3354a08e932dd69d3e606b4e738156c7a03d7c0c' => :mavericks
    sha1 '9e7898dbe8a7cb7c27dcfef037a5e81baea7c381' => :mountain_lion
    sha1 '38415f46db3de09fbb4ad819d212e8c39f28e89a' => :lion
  end

  mirror 'ftp://ftp.cs.tu-berlin.de/pub/net/ftp/lftp/lftp-4.4.11.tar.bz2'
  sha1 'cb3a115a34e9330b448fd5770f52923f8e8451f6'

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
