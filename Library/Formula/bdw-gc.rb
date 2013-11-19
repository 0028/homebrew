require 'formula'

class BdwGc < Formula
  homepage 'http://www.hpl.hp.com/personal/Hans_Boehm/gc/'
  url 'http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-7.2e.tar.gz'
  sha1 '3ad593c6d0ed9c0951c21a657b86c55dab6365c8'

  bottle do
    cellar :any
    sha1 'ec70613b7da1d4b87bc4b052326d88fea78a5f1e' => :mavericks
    sha1 'e490ec3beec1bcce9f62ba56cc6a188741ab3a9b' => :mountain_lion
    sha1 'bde27d3b630e256d27a8477206f61fd8485bd559' => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-cplusplus"
    system "make"
    system "make check"
    system "make install"
  end
end
