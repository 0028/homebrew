require 'formula'

class Logcheck < Formula
  homepage 'http://logcheck.alioth.debian.org/'
  url 'http://ftp.de.debian.org/debian/pool/main/l/logcheck/logcheck_1.3.16.tar.xz'
  sha1 '27892a6abf3822d285efbb26f935d80762134679'

  bottle do
    cellar :any
    sha1 "530883424c23731356b50ab75b8cd1114d9eddb8" => :mavericks
    sha1 "533128643d672f63abdd5275a83834c426db5f6d" => :mountain_lion
    sha1 "b0d81ca4844f5508ec94d6915e15a722a1cdffad" => :lion
  end

  def install
    system "make", "install",
                   "--always-make",
                   "DESTDIR=#{prefix}",
                   "SBINDIR=sbin",
                   "BINDIR=bin"
  end

  def test
    system "#{sbin}/logtail", "-f", "#{HOMEBREW_REPOSITORY}/README.md"
  end
end
