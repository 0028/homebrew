require 'formula'

class Hercules < Formula
  homepage 'http://www.hercules-390.eu/'
  url 'http://downloads.hercules-390.eu/hercules-3.09.tar.gz'
  sha1 '5cbe89ec214de00b90e3077c27db636a7d2607f5'

  bottle do
    sha1 '7f59090394bee1bbece34d111f21e0dcac85a97b' => :mavericks
    sha1 '3e8c664a725a4ec67d19f30887cb6452fd29b3a3' => :mountain_lion
    sha1 '86a1f430182dd9179969fb89275875117ad8aaae' => :lion
  end

  depends_on 'gawk'

  def install
    # Since Homebrew optimizes for us, tell Hercules not to.
    # (It gets it wrong anyway.)
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-optimization=no"
    inreplace "hscutl.c", "SOL_TCP", "IPPROTO_TCP"
    system "make"
    system "make install"
  end
end
