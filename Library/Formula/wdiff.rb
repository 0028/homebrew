require 'formula'

class Wdiff < Formula
  homepage 'http://www.gnu.org/software/wdiff/'
  url 'http://ftpmirror.gnu.org/wdiff/wdiff-1.2.2.tar.gz'
  bottle do
    cellar :any
    sha1 "6e4e460fe62d0b917178fdb2da17bd0445898779" => :mavericks
    sha1 "1c1450bb89c1d60453cd8982b011d869468a0527" => :mountain_lion
    sha1 "9b3e267888c0f8cf7aa89368a73092262bfabd64" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/wdiff/wdiff-1.2.2.tar.gz'
  sha1 'c93b5cb593257d814212e15fc371ff6c6b952c3d'

  depends_on 'gettext' => :optional

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-experimental"
    system "make install"
  end

  test do
    a = testpath/"a.txt"
    a.write "The missing package manager for OS X"

    b = testpath/"b.txt"
    b.write "The package manager for OS X"

    out = `#{bin}/wdiff #{a} #{b}`
    assert_equal "The [-missing-] package manager for OS X", out
    assert_equal 1, $?.exitstatus
  end
end
