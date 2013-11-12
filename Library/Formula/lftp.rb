require 'formula'

class Lftp < Formula
  homepage 'http://lftp.yar.ru/'
  url 'http://lftp.yar.ru/ftp/lftp-4.4.11.tar.bz2'
  bottle do
    sha1 '1616941010b30946e6c46d2f93060143af07eec1' => :mavericks
    sha1 '1530fa3f5fd99404df23d2caeb90de7831f809da' => :mountain_lion
    sha1 'da2ab80b58a8d39c90245621c71934516b1ec4e7' => :lion
  end

  mirror 'ftp://ftp.cs.tu-berlin.de/pub/net/ftp/lftp/lftp-4.4.11.tar.bz2'
  sha1 '56cefb9aa683acfa5c5713d530f594085ea7b149'

  depends_on 'pkg-config' => :build
  depends_on 'readline'
  depends_on 'gnutls'

  def install
    # Bus error
    # TODO what are the more specific circumstances?
    ENV.no_optimization if MacOS.version <= :leopard

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
