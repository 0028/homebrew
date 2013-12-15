require 'formula'

class Openlitespeed < Formula
  homepage 'http://www.litespeedtech.com/'
  url 'http://open.litespeedtech.com/packages/openlitespeed-1.2.7.tgz'
  sha1 'f2f0388fd38274383c692ff96067f749c9418fc9'

  head 'https://github.com/litespeedtech/openlitespeed.git'

  bottle do
    sha1 '861f9e16e2916fa668aeeb81fe310aa9bb00035e' => :mavericks
    sha1 'ad70e4a8b06d6f5b470eb3947907ec272c791939' => :mountain_lion
    sha1 '4a6c45a8f920ef43c32867c0d4a8ff3b5b468892' => :lion
  end

  option 'with-debug', 'Compile with support for debug log'
  option 'with-spdy', 'Compile with support for SPDY module'

  depends_on 'pcre'
  depends_on 'geoip'
  # SPDY needs openssl >= 1.0.1 for NPN; see:
  # https://tools.ietf.org/agenda/82/slides/tls-3.pdf
  # http://www.openssl.org/news/changelog.html
  depends_on 'openssl' if build.with? 'spdy'

  def install
    args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]
    args << "--enable-debug" if build.include? 'with-debug'
    args << "--enable-spdy" if build.include? 'with-spdy'
    args << "--with-openssl=#{Formula.factory('openssl').opt_prefix}" if build.include? 'with-spdy'
    system "./configure", *args
    system "make"
    system "make install"
  end
end
