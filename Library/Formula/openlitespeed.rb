require "formula"

class Openlitespeed < Formula
  homepage "http://open.litespeedtech.com/mediawiki/"
  url "http://open.litespeedtech.com/packages/openlitespeed-1.2.9.tgz"
  sha1 "dbdfa1337caeabaca6814e2c12266f5570f14dd7"
  head "https://github.com/litespeedtech/openlitespeed.git"

  bottle do
    sha1 "34b70e113149ec0e7a3a1ca2a6acb30422102836" => :mavericks
    sha1 "2b301e38da5f8632f3e32e2122e5fd92c3e05f4d" => :mountain_lion
    sha1 "836c8dbeb98fa3036e236eb380f6c188b242774b" => :lion
  end

  option "with-debug", 'Compile with support for debug log'
  option "with-spdy", 'Compile with support for SPDY module'

  depends_on "pcre"
  depends_on "geoip"
  # SPDY needs openssl >= 1.0.1 for NPN; see:
  # https://tools.ietf.org/agenda/82/slides/tls-3.pdf
  # http://www.openssl.org/news/changelog.html
  depends_on "openssl" if build.with? 'spdy'

  def install
    args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]
    args << "--enable-debug" if build.with? 'debug'
    args << "--enable-spdy" if build.with? 'spdy'
    args << "--with-openssl=#{Formula.factory('openssl').opt_prefix}" if build.with? 'spdy'
    system "./configure", *args
    system "make", "install"
  end
end
