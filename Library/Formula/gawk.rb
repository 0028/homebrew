require 'formula'

class Gawk < Formula
  homepage 'http://www.gnu.org/software/gawk/'
  url 'http://ftpmirror.gnu.org/gawk/gawk-4.1.0.tar.xz'
  bottle do
    sha1 "32b991448dc2db91d56721015e0dddbaab639e6f" => :mavericks
    sha1 "e0d836fa58c43c5495dcfbbf2e5dc6410086a3ca" => :mountain_lion
    sha1 "c919d93624df68c4828ff7bb103d643e13ee22da" => :lion
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
    output = `echo "Macrobrew" | '#{bin}/gawk'  '{ gsub(/Macro/, "Home"); print }' -`
    assert_equal 'Homebrew', output.strip
    assert_equal 0, $?.exitstatus
  end
end
