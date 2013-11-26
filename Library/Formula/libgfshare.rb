require 'formula'

class Libgfshare < Formula
  homepage 'http://www.digital-scurf.org/software/libgfshare'
  url 'http://www.digital-scurf.org/files/libgfshare/libgfshare-1.0.5.tar.gz'
  sha1 '165c721e04a2aa0bd2f3b14377bca8f65603640a'

  bottle do
    cellar :any
    sha1 'aab7893e54b1ee900b8e57722f8d1f258963381d' => :mavericks
    sha1 '3589a1e62712c5b239a1e4052be805c5bda7ad2f' => :mountain_lion
    sha1 'a874f5d7290b8c0800578b0a17eeacacf2ff1f4c' => :lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--disable-linker-optimisations",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/gfsplit","--version"
  end
end
