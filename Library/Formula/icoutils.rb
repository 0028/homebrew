require 'formula'

class Icoutils < Formula
  homepage 'http://www.nongnu.org/icoutils/'
  url 'http://savannah.nongnu.org/download/icoutils/icoutils-0.31.0.tar.bz2'
  sha1 '2712acd33c611588793562310077efd2ff35dca5'

  bottle do
    cellar :any
    sha1 "2a0469e803091d50e32fb79a2138d0614b5ec228" => :mavericks
    sha1 "b0564354c2d10d48ec556288d9487b752e45cb71" => :mountain_lion
    sha1 "b7731129dfa5a6abdb2d0e77b0e496fe848a18b9" => :lion
  end

  depends_on :libpng

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-rpath",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
