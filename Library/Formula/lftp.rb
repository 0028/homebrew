require 'formula'

class Lftp < Formula
  homepage 'http://lftp.yar.ru/'
  url 'http://lftp.yar.ru/ftp/lftp-4.4.15.tar.bz2'
  sha1 '3747de76b0ff472bcf1ce353025967cdbcc35cb7'

  bottle do
    sha1 "925fd8c478dfa7381c93fbdd7b26d729f318584c" => :mavericks
    sha1 "cf71e8eec2ebb20d250b544b36b5643ec977cd6f" => :mountain_lion
    sha1 "96dc8638062d82f04532ae4e7f7508cfd1d7b733" => :lion
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
