require 'formula'

class Gtkwave < Formula
  homepage 'http://gtkwave.sourceforge.net/'
  url 'http://gtkwave.sourceforge.net/gtkwave-3.3.57.tar.gz'
  sha1 'ec81f03bac12852f24717159fa202c5077dfbe68'

  bottle do
    cellar :any
    sha1 "8cc1da508bcb9d05f0fad75ea9786f44dce8b63c" => :mavericks
    sha1 "01e48a5ce74eb5c48650169d508285d7891160a5" => :mountain_lion
    sha1 "5a1f756f741ffa086303a7ecc4541fef45eebf65" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'gtk+'
  depends_on 'xz'
  depends_on :x11

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
