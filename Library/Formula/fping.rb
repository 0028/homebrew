require 'formula'

class Fping < Formula
  homepage 'http://fping.org/'
  url 'http://fping.org/dist/fping-3.9.tar.gz'
  sha1 '4bbd659abc800fde0333799b223c068b3bb303a7'

  head 'https://github.com/schweikert/fping.git'

  bottle do
    cellar :any
    sha1 "c9f11c991743cdf9d90926d06d119acfdf0f8805" => :mavericks
    sha1 "9399e57d606a1bf69ef9a9bc32d980c3c1bb5e63" => :mountain_lion
    sha1 "74dc26bd04293cf8bcf22ba4a3e823f0a084876c" => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sbindir=#{bin}",
                          "--enable-ipv6"
    system "make install"
  end

end
