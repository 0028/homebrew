require 'formula'

class Coin < Formula
  homepage 'https://bitbucket.org/Coin3D/coin/wiki/Home'
  url 'https://bitbucket.org/Coin3D/coin/downloads/Coin-3.1.3.tar.gz'
  sha1 '8e9f05628461963623686d3ec53102214e233dd1'

  bottle do
    sha1 '1c0cec55ef6296e448c0c41307ff731367b2d620' => :mavericks
    sha1 'a6e479a35809cc57e96878e33f69347eee155e74' => :mountain_lion
    sha1 '9030928bfb1e7d44fe99ff5f8e13a0eb6278a1e5' => :lion
  end

  def install
    # https://bitbucket.org/Coin3D/coin/issue/47 (fix misspelled test flag)
    inreplace "configure", '-fno-for-scoping', '-fno-for-scope'

    # https://bitbucket.org/Coin3D/coin/issue/45 (suppress math-undefs)
    # http://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/graphics/Coin/patches/patch-include_Inventor_C_base_math-undefs.h
    inreplace "include/Inventor/C/base/math-undefs.h", "#ifndef COIN_MATH_UNDEFS_H", "#if false"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-framework-prefix=#{lib}"
    system "make install"
  end
end
