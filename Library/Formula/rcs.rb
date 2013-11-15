require 'formula'

class Rcs < Formula
  homepage 'https://www.gnu.org/software/rcs/'
  url 'http://ftpmirror.gnu.org/rcs/rcs-5.9.1.tar.xz'
  sha1 '2e1017c24cd79ed434fa80e384ba844738c2cbfe'

  bottle do
    cellar :any
    sha1 'ac28c4100ae626656905cb4e28b06e2f8ab3fd8d' => :mavericks
    sha1 '41e8fd95d2fc9f9c9d73e696f546fbd71c1dca01' => :mountain_lion
    sha1 'bd3f17a59936588250b0b7a0dc4b03a14b7e61fd' => :lion
  end

  depends_on 'xz' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"merge", "--version"
  end
end
