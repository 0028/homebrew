require 'formula'

class Concurrencykit < Formula
  homepage 'http://concurrencykit.org'
  url 'http://concurrencykit.org/releases/ck-0.3.4.tar.gz'
  sha1 'bf32af29ca174f068ed8772aed1647ab3d474264'

  head 'git://git.concurrencykit.org/ck.git'

  bottle do
    cellar :any
    sha1 'c96738fb0af7dc5eceadfa0372dbe011bf1614c9' => :mavericks
    sha1 'f45620ad5ac95626c79bd3accedc94b28f58c222' => :mountain_lion
    sha1 '53537313a4bd369af06fed381d6b4ad36300e785' => :lion
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
