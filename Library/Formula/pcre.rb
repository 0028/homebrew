require 'formula'

class Pcre < Formula
  homepage 'http://www.pcre.org/'
  url 'http://downloads.sourceforge.net/project/pcre/pcre/8.34/pcre-8.34.tar.bz2'
  mirror 'ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.34.tar.bz2'
  sha256 'b6043ae1ff2720be665ffa28dc22b7c637cdde96f389a116c0c3020caeae583f'

  keg_only "Some formulas that don't depend on pcre will silently pick it up anyway; they will then be broken if the user removes pcre."

  bottle do
    cellar :any
    revision 1
    sha1 "212675639bb09fdabc884c218cb3bf31e7e60170" => :mavericks
    sha1 "0ed79da5e8effdd4b755224e4f42b50a63b9285a" => :mountain_lion
    sha1 "979b696f9c177f74eca49faf2821fd4a0e8d46c0" => :lion
  end

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
                          "--enable-pcre8",
                          "--enable-pcre16",
                          "--enable-pcre32",
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
