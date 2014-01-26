require 'formula'

class Rust < Formula
  homepage 'http://www.rust-lang.org/'
  url 'http://static.rust-lang.org/dist/rust-0.9.tar.gz'
  sha1 '6c5ef4c3c87a1b424510e41ad95dd17981b707b3'

  head 'https://github.com/mozilla/rust.git'

  bottle do
    revision 1
    sha1 "29caafa2bd5576a1070d18cf431755e73a8e8c68" => :mavericks
    sha1 "cb5fcf8f0ef333cee137a505e426d4bf7afab766" => :mountain_lion
    sha1 "3406bae1b2531b571dc059b6ac0db4988a82221c" => :lion
  end

  fails_with :clang do
    build 318
    cause "cannot initialize a parameter of type 'volatile long long *' with an rvalue of type 'int *'"
  end

  def install
    args = ["--prefix=#{prefix}"]
    args << "--enable-clang" if ENV.compiler == :clang
    system "./configure", *args
    system "make"
    system "make install"
  end

  def test
    system "#{bin}/rustc"
    system "#{bin}/rustdoc -h"
    system "#{bin}/rustpkg -v"
  end
end
