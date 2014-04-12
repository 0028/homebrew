require 'formula'

class Lzip < Formula
  homepage 'http://www.nongnu.org/lzip/lzip.html'
  url 'http://download.savannah.gnu.org/releases/lzip/lzip-1.15.tar.gz'
  sha1 'a79d062d72071b5bb2bb7ef50dda6ac408c24192'

  bottle do
    cellar :any
    sha1 "86019423051fe878371e416448300efb585270d9" => :mavericks
    sha1 "3a23a3dfe34e1e182857a90500c35180965b3c4e" => :mountain_lion
    sha1 "8215afe3d058ef96552fcf7d2519653835a5fca3" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "CXX=#{ENV.cxx}",
                          "CXXFLAGS=#{ENV.cflags}"
    system "make check"
    ENV.j1
    system "make install"
  end

  test do
    path = testpath/"data.txt"
    original_contents = "." * 1000
    path.write original_contents

    # compress: data.txt -> data.txt.lz
    system "#{bin}/lzip", path
    assert !path.exist?

    # decompress: data.txt.lz -> data.txt
    system "#{bin}/lzip", "-d", "#{path}.lz"
    assert_equal original_contents, path.read
  end
end
