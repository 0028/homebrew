require 'formula'

class Fping < Formula
  homepage 'http://fping.org/'
  url 'http://fping.org/dist/fping-3.9.tar.gz'
  sha1 '4bbd659abc800fde0333799b223c068b3bb303a7'

  head 'https://github.com/schweikert/fping.git'

  bottle do
    cellar :any
    sha1 "ee4238f6235a48090011e463d87393c4d7f0810b" => :mavericks
    sha1 "7037c987dab5f8c45ff5c9dcedaf705f8b1599c1" => :mountain_lion
    sha1 "f01270e0f795bf3fec876e32e83612f5c157e19f" => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-ipv6"
    system "make install"
  end

end
