require 'formula'

class Gawk < Formula
  homepage 'http://www.gnu.org/software/gawk/'
  url 'http://ftpmirror.gnu.org/gawk/gawk-4.1.0.tar.xz'
  bottle do
    sha1 "590c3eb5410fe251ecd2ac54308d9ffc880941ec" => :mavericks
    sha1 "9e0c07d0869b966f650874c96b0044ee8bb5bef7" => :mountain_lion
    sha1 "a90b6da3752130deb44fef635143a04dcb65e162" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/gawk/gawk-4.1.0.tar.xz'
  sha1 'caabca3c1a59d05807c826c45a4639b82cad612a'

  depends_on 'xz' => :build

  fails_with :llvm do
    build 2326
    cause "Undefined symbols when linking"
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--without-readline",
                          "--without-mpfr",
                          "--without-libsigsegv-prefix"
    system "make"
    system "make check"
    system "make install"
  end

  test do
    output = `echo "Macrobrew" | gawk  '{ gsub(/Macro/, "Home"); print }' -`
    assert_equal 'Homebrew', output.strip
    assert_equal 0, $?.exitstatus
  end
end
