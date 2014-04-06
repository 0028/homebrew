require "formula"

class Termrec < Formula
  homepage "http://angband.pl/termrec.html"
  url "https://github.com/kilobyte/termrec/archive/0.17.tar.gz"
  sha1 "45df1b35b7f236fafd1e4db9c45543501dfde359"
  bottle do
    cellar :any
    sha1 "e191441460af04f40e96e69cfe35d4e4ab97d143" => :mavericks
    sha1 "1f1fdd5aea93622fa6cdb21205c65afa1a596b35" => :mountain_lion
    sha1 "53cf5ba225b89baf8127359475996b5f13e7fa3d" => :lion
  end

  head "http://angband.pl/git/termrec/", :using => :git
  depends_on "libtool" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "xz"

  def install
    inreplace "autogen", "libtoolize", "glibtoolize"
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
