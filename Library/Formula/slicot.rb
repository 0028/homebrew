require 'formula'

class Slicot < Formula
  homepage 'http://www.slicot.org'
  url 'http://ftp.de.debian.org/debian/pool/main/s/slicot/slicot_5.0+20101122.orig.tar.gz'
  version '5.0+20101122'
  sha1 'ec240abbf6d3d60da3a7dc21d22104abdfd86bd8'

  bottle do
    cellar :any
    sha1 "e67d85ef83ce4eda8340323656c818a3f1432e7f" => :mavericks
    sha1 "a1f2342437e1aea9c47e25273b12801a3554476c" => :mountain_lion
    sha1 "b54fb3d6264f1e537c48e4a08190e4a96afef0d4" => :lion
  end

  option 'with-default-integer-8', 'Build with 8-byte-wide integer type'

  depends_on :fortran

  def install
    args = [
      "FORTRAN=#{ENV.fc}",
      "LOADER=#{ENV.fc}",
    ]

    slicotlibname = "libslicot_pic.a"
    system "make", "lib", "OPTS=-fPIC", "SLICOTLIB=../#{slicotlibname}", *args
    lib.install "#{slicotlibname}"

    if build.with? "default-integer-8"
      system "make", "clean"
      slicotlibname = "libslicot64_pic.a"
      system "make", "lib", "OPTS=-fPIC -fdefault-integer-8", "SLICOTLIB=../#{slicotlibname}", *args
      lib.install "#{slicotlibname}"
    end
  end
end
