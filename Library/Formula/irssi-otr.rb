require "formula"

class IrssiOtr < Formula
  homepage "http://irssi-otr.tuxfamily.org/"
  url "ftp://download.tuxfamily.org/irssiotr/irssi-otr-0.3.tar.gz"
  sha1 "5b831dd64e7d84fcda45219b71f017233a6c327b"

  bottle do
    cellar :any
    sha1 "d7f32df01349bcf0d1482057fe3ff48ef99830e2" => :mavericks
    sha1 "0b8f8e605fbf2d54b57bee4e2f342392dd6d1169" => :mountain_lion
    sha1 "d1d3755f3a2d71c88027ad6e2bf48b8f9585e362" => :lion
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on :python => :build
  depends_on "glib"
  depends_on "libotr"
  depends_on "irssi"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  def caveats
    <<-EOS.undent
      * For Irssi to find irssi-otr, symlink it into your personal config:

      mkdir -p ~/.irssi/modules
      ln -s #{lib}/irssi/modules/libotr.so ~/.irssi/modules/
    EOS
  end

  test do
    system "test", "-f", "#{lib}/irssi/modules/libotr.so"
  end
end
