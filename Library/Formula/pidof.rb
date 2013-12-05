require 'formula'

class Pidof < Formula
  homepage 'http://www.nightproductions.net/cli.htm'
  url 'http://www.nightproductions.net/downloads/pidof_source.tar.gz'
  sha1 '150ff344d7065ecf9bc5cb3c2cc83eeda8d31348'
  version '0.1.4'

  bottle do
    cellar :any
    sha1 '1c51fd428759bacd20ee38920ba23475853c9ce7' => :mavericks
    sha1 '5fcbf4b996e9cc5012a47c2f226feec35852378c' => :mountain_lion
    sha1 '8b2733a80cdf44f1fee92251604bc27e94225f67' => :lion
  end

  def install
    system "make", "all", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
    man1.install gzip("pidof.1")
    bin.install "pidof"
  end
end
