require 'formula'

class Nettle < Formula
  homepage 'http://www.lysator.liu.se/~nisse/nettle/'
  url 'http://www.lysator.liu.se/~nisse/archive/nettle-2.7.1.tar.gz'
  sha1 'e7477df5f66e650c4c4738ec8e01c2efdb5d1211'

  bottle do
    cellar :any
    sha1 '1fc8c9f59619fc4e9e5d9463d370d81c1598cfc7' => :mavericks
    sha1 '16c1dcea2cca96b29498cfb829dbccc8eb8e696b' => :mountain_lion
    sha1 '6ebc9a219165f9dec14c8036123489584e16824a' => :lion
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
