require 'formula'

class BdwGc < Formula
  homepage 'http://www.hboehm.info/gc/'
  url 'http://www.hboehm.info/gc/gc_source/gc-7.2e.tar.gz'
  sha1 '3ad593c6d0ed9c0951c21a657b86c55dab6365c8'

  bottle do
    cellar :any
    revision 1
    sha1 "877a124051a0be37bce59d01f857ba4af54ec647" => :mavericks
    sha1 "4980150d40f5bac20673400471f0ecd2872b5e85" => :mountain_lion
    sha1 "b12bfa6d48c891fd25e8086aedb735fc3c93611e" => :lion
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
