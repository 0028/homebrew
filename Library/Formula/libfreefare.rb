require 'formula'

class Libfreefare < Formula
  homepage 'https://code.google.com/p/libfreefare/'
  url 'https://libfreefare.googlecode.com/files/libfreefare-0.4.0.tar.bz2'
  sha1 '74214069d6443a6a40d717e496320428a114198c'
  bottle do
    cellar :any
    sha1 'e4f5135d44871c748c019995d1eba71a94238e8c' => :mavericks
    sha1 '3d576399cbca7947334ed021377a0680a1734dff' => :mountain_lion
    sha1 '67ce6c61033831993943a1fbd83ed88b74b7ea01' => :lion
  end

  depends_on 'libnfc'
  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

end
