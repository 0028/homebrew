require 'formula'

class Rust < Formula
  homepage 'http://www.rust-lang.org/'
  url 'http://static.rust-lang.org/dist/rust-0.9.tar.gz'
  sha1 '6c5ef4c3c87a1b424510e41ad95dd17981b707b3'

  head 'https://github.com/mozilla/rust.git'

  bottle do
    revision 1
    sha1 "542d3001dcaf2551c951080416d034aa8c9ef5e7" => :mavericks
    sha1 "3a25904320131b2f0158aa360bbb79c750e75145" => :mountain_lion
    sha1 "28e5b865fe7deb7cb92f71607518a9dfe3226203" => :lion
  end

  fails_with :clang do
    build 318
    cause "cannot initialize a parameter of type 'volatile long long *' with an rvalue of type 'int *'"
  end

  def install
    args = ["--prefix=#{prefix}"]
    args << "--disable-rpath" if build.head?
    args << "--enable-clang" if ENV.compiler == :clang
    system "./configure", *args
    system "make"
    system "make install"
  end

  def test
    system "#{bin}/rustc"
    system "#{bin}/rustdoc -h"
    system "#{bin}/rustpkg -v" unless build.head?
  end
end
