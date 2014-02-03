require "formula"

class Termrec < Formula
  homepage "http://angband.pl/termrec.html"
  head "http://angband.pl/git/termrec/", :using => :git
  depends_on "libtool" => :build
  depends_on "automake" => :build
  depends_on "xz"

  def install
    system "sed", "-i", "-e", "s/libtoolize/glibtoolize/", "autogen"
    system "./autogen"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/termrec", "--help"
  end
end
