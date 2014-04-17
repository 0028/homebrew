require 'formula'

class Concurrencykit < Formula
  homepage 'http://concurrencykit.org'
  url 'http://concurrencykit.org/releases/ck-0.4.1.tar.gz'
  sha1 '53be7f3cc42bf46f409926a8add911bf49f37c20'

  head 'https://github.com/concurrencykit/ck.git'

  bottle do
    cellar :any
    revision 1
    sha1 "6e99b22b29b3e30ddd8a81d8d327a65fe9018b4b" => :mavericks
    sha1 "2428d99a291c2a8645c5c696f22e27fee9ff6b3e" => :mountain_lion
    sha1 "eda7e0e9182960ae7aec72033a4185d7f85aa7ba" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "CC=#{ENV.cc}"
    system "make install"
  end
end
