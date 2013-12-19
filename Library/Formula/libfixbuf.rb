require 'formula'

class Libfixbuf < Formula
  homepage 'http://tools.netsa.cert.org/fixbuf/'
  url 'http://tools.netsa.cert.org/releases/libfixbuf-1.4.0.tar.gz'
  sha1 'cafb865c02ab78ef86f10153b1ff671fbe7d375a'

  bottle do
    cellar :any
    sha1 'cc5b48bfbffad5c43ce5b1e8137784dafae10e83' => :mavericks
    sha1 'd05e096b6f03a157fb728627b9ccfdb257c174e8' => :mountain_lion
    sha1 'be11c446bf2b6dacfe711a3eacbb8b1ef87e4ee1' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'glib'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make"
    system "make install"
  end
end
