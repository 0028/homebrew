require 'formula'

class Pcre < Formula
  homepage 'http://www.pcre.org/'
  url 'http://downloads.sourceforge.net/project/pcre/pcre/8.33/pcre-8.33.tar.bz2'
  bottle do
    cellar :any
    sha1 '86525ca2be60dfe42dd80856a0f2cfc6587695f3' => :mavericks
    sha1 '57343161a2d10b7feb99150d5a513db47aab13d8' => :mountain_lion
    sha1 'f66d658e5d5e5004b1cf3e7e519022124cffb848' => :lion
  end

  mirror 'ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.33.tar.bz2'
  sha256 'c603957a4966811c04af5f6048c71cfb4966ec93312d7b3118116ed9f3bc0478'

  option :universal

  fails_with :llvm do
    build 2326
    cause "Bus error in ld on SL 10.6.4"
  end

  def install
    ENV.universal_binary if build.universal?

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-utf8",
                          "--enable-unicode-properties",
                          "--enable-pcregrep-libz",
                          "--enable-pcregrep-libbz2",
                          "--enable-jit"
    system "make"
    ENV.deparallelize
    system "make test"
    system "make install"
  end
end
