require 'formula'

class Bup < Formula
  homepage 'https://github.com/bup/bup'
  head 'https://github.com/bup/bup.git', :branch => 'master'
  url 'https://github.com/bup/bup/archive/0.25-rc4.tar.gz'
  version '0.25-rc4'
  sha1 '12f382dcb7e1d3b8496dfc32d2395e80cf5d971e'

  bottle do
    cellar :any
    sha1 '33a0628b0a6ea0a4786b0e9986c24addcc8e91ce' => :mavericks
    sha1 '66a94c454ee662876703491d678ccfaae9b8f650' => :mountain_lion
    sha1 '93c0fe2a003ec2f7d6dfed484e6496aa80357549' => :lion
  end

  option "run-tests", "Run unit tests after compilation"

  depends_on :python

  def install
    python do
      system "make"
    end
    system "make test" if build.include? "run-tests"
    system "make", "install", "DESTDIR=#{prefix}", "PREFIX="
  end
end
