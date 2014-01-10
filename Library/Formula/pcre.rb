require 'formula'

class Pcre < Formula
  homepage 'http://www.pcre.org/'
  url 'http://downloads.sourceforge.net/project/pcre/pcre/8.34/pcre-8.34.tar.bz2'
  bottle do
    cellar :any
    sha1 '87174d1664f04a07de266a9cfa35598ce7d82a16' => :mavericks
    sha1 '078584117f65701358ed41b26c54869d2d384a5b' => :mountain_lion
    sha1 '49ab80f7fb8d8d86a3df0058ee7f127435726eb6' => :lion
  end

  mirror 'ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.34.tar.bz2'
  sha256 'b6043ae1ff2720be665ffa28dc22b7c637cdde96f389a116c0c3020caeae583f'

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
