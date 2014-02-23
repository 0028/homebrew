require 'formula'

class Concurrencykit < Formula
  homepage 'http://concurrencykit.org'
  url 'http://concurrencykit.org/releases/ck-0.3.5.tar.gz'
  sha1 '4186bd44603e4aec8d63e46d1b8151fdc0ba46ef'

  head 'git://git.concurrencykit.org/ck.git'

  bottle do
    cellar :any
    sha1 "c1eb4c58bb0555e98936c7b0b22defcbc492f2e3" => :mavericks
    sha1 "9429b0439a715fc034a92df852a81775d3521b74" => :mountain_lion
    sha1 "59e30ab2778264917a732ce13bf3e5e3c1dcae7b" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "CC=#{ENV.cc}"
    system "make install"
    mv lib/"libck.so.#{version}", lib/"libck.#{version}.dylib"
    ln_s "libck.#{version}.dylib",  lib/"libck.0.dylib"
    ln_s "libck.#{version}.dylib",  lib/"libck.dylib"
  end
end
