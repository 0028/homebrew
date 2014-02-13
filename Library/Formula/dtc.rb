require "formula"

class Dtc < Formula
  homepage "http://www.devicetree.org/"
  url "http://ftp.debian.org/debian/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.0+dfsg.orig.tar.gz"
  sha1 "2f9697aa7dbc3036f43524a454bdf28bf7e0f701"

  bottle do
    cellar :any
    sha1 "39d8aeaa42ce6de22bc4f1d6acc0952cf8d55bce" => :mavericks
    sha1 "5c13d170f6be8d9aee0a195cae247e1753ee0ba2" => :mountain_lion
    sha1 "6692808e91e508cc7f9c53366cce27e7391cba3c" => :lion
  end

  def install
    system "make"
    system "make", "DESTDIR=#{prefix}", "PREFIX=", "install"
    # remove symlink that doesn't pass audit
    system "rm", "-f", lib/"libfdt.dylib.1"
  end

  test do
    (testpath/'test.dts').write <<-EOF.undent
    /dts-v1/;
    / {
    };
    EOF
    system "#{bin}/dtc", "test.dts"
  end
end
