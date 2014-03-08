require "formula"

class Bmake < Formula
  homepage "http://www.crufty.net/help/sjg/bmake.html"
  url "http://www.crufty.net/ftp/pub/sjg/bmake-20140214.tar.gz"
  sha1 "844fc7ccf8219f8327f4f950b633b9d2bdac87b5"

  def install
    # The first, an oversight upstream; the second, don't pre-roff cat pages.
    inreplace "bmake.1", ".Dt MAKE", ".Dt BMAKE"
    inreplace "mk/man.mk", "MANTARGET?", "MANTARGET"

    # -DWITHOUT_PROG_LINK means "don't symlink as bmake-VERSION."
    args = [ "--prefix=#{prefix}", "-DWITHOUT_PROG_LINK", "--install" ]

    system "sh", "boot-strap", *args

    man1.install "bmake.1"
  end

  def test
    %x(tomake(){ command printf "$@\n" >> makefile ;};
       tomake "all: hello";
       tomake;
       tomake "hello:";
       tomake "\t@echo 'Test successful.'";
       tomake;
       tomake "clean:";
       tomake "\trm -rf makefile")

     system "bmake"
     system "bmake", "clean"
  end
end
