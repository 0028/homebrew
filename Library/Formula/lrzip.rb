require 'formula'

class Lrzip < Formula
  homepage 'http://lrzip.kolivas.org'
  url 'http://ck.kolivas.org/apps/lrzip/lrzip-0.614.tar.bz2'
  sha1 'b3c2149c9ca353f595d7f2774262244cc56a7500'

  bottle do
    cellar :any
    sha1 "4f3b254781c6694f39f6e9d68e8044bb015600ac" => :mavericks
    sha1 "706b462ba71735822d4a995527b3bfd58228913c" => :mountain_lion
    sha1 "e0faf2e2d246c7ca4cbb3c89a4807a68c8d44a6d" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on "lzo"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end

  test do
    path = testpath/"data.txt"
    original_contents = "." * 1000
    path.write original_contents

    # compress: data.txt -> data.txt.lrz
    system bin/"lrzip", "-o", "#{path}.lrz", path
    path.unlink

    # decompress: data.txt.lrz -> data.txt
    system bin/"lrzip", "-d", "#{path}.lrz"
    assert_equal original_contents, path.read
  end
end
