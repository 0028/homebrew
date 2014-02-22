require 'formula'

class Libextractor < Formula
  homepage 'http://www.gnu.org/software/libextractor/'
  url 'http://ftpmirror.gnu.org/libextractor/libextractor-1.3.tar.gz'
  bottle do
    cellar :any
    sha1 "d2ca870d0703267a0b7aca702aba83af60a040bd" => :mavericks
    sha1 "67e8f6fe230a85660e0459b70e3c67a78825a28e" => :mountain_lion
    sha1 "87e3557555a8b1838eefb3d35313ab49ff90c85e" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/libextractor/libextractor-1.3.tar.gz'
  sha1 '613d0b80e83c79c3e05e073bcda0d0d0bd1f3336'

  depends_on 'pkg-config' => :build
  depends_on :libtool => :run
  depends_on 'iso-codes' => :optional

  def install
    ENV.deparallelize
    system "./configure", "--disable-silent-rules",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/extract", "-v"
  end
end
