require "formula"

class Bmake < Formula
  homepage "http://www.crufty.net/help/sjg/bmake.html"
  url "http://www.crufty.net/ftp/pub/sjg/bmake-20140214.tar.gz"
  sha1 "844fc7ccf8219f8327f4f950b633b9d2bdac87b5"

  bottle do
    sha1 "ee6d2f5c46d1592e6104d42bb2e85639c7939f6d" => :mavericks
    sha1 "4c0bc242f4034b19cf4991e688845e8d4cac9790" => :mountain_lion
    sha1 "8b39d6bee60cf0bb03519db2892384e8262aa405" => :lion
  end

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
