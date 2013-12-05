require 'formula'

class Pidof < Formula
  homepage 'http://www.nightproductions.net/cli.htm'
  url 'http://www.nightproductions.net/downloads/pidof_source.tar.gz'
  sha1 '150ff344d7065ecf9bc5cb3c2cc83eeda8d31348'
  version '0.1.4'

  bottle do
    cellar :any
    sha1 'fcc63653f62a74e5a536ad53fca486c0f9069d6f' => :mavericks
    sha1 '21f3f668918bd3e903811de70466faeb73b73ff5' => :mountain_lion
    sha1 '49d8865d855721a2d9beec53f455bcbf72e4aa82' => :lion
  end

  def install
    system "make", "all", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
    man1.install gzip("pidof.1")
    bin.install "pidof"
  end
end
