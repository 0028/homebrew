require 'formula'

class Nettle < Formula
  homepage 'http://www.lysator.liu.se/~nisse/nettle/'
  url 'http://www.lysator.liu.se/~nisse/archive/nettle-2.6.tar.gz'
  sha1 '401f982a0b365e04c8c38c4da42afdd7d2d51d80'

  bottle do
    cellar :any
    sha1 "28d35841073438ae0687b9144b1a5996376e6e43" => :mavericks
    sha1 "5c077cf3c7f9cfdc4c90d322e0f728e3e2250ccf" => :mountain_lion
    sha1 "9be9c8879c89f052bf8e09ce1a7d843d46a90d6e" => :lion
  end

  depends_on 'gmp'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-shared"
    system "make"
    system "make install"
    system "make check"
  end
end
