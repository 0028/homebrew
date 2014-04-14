require 'formula'

class Wdiff < Formula
  homepage 'http://www.gnu.org/software/wdiff/'
  url 'http://ftpmirror.gnu.org/wdiff/wdiff-1.2.1.tar.gz'
  bottle do
    cellar :any
    sha1 "bd0ca3785834d34a16f8742cc8917dae166ddea3" => :mavericks
    sha1 "b7524adb56ee590d7420692cfaad09cb9b91d908" => :mountain_lion
    sha1 "6505333f219c014ff65ba2e5cb4c5bd8b189a9cb" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/wdiff/wdiff-1.2.1.tar.gz'
  sha1 '6b5c7c97252cfe607bb1db7db148061be7259a7e'

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
