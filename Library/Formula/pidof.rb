require 'formula'

class Pidof < Formula
  homepage 'http://www.nightproductions.net/cli.htm'
  url 'http://www.nightproductions.net/downloads/pidof_source.tar.gz'
  sha1 '150ff344d7065ecf9bc5cb3c2cc83eeda8d31348'
  version '0.1.4'

  bottle do
    cellar :any
    sha1 '1e9978e83e094e8dcebfea551d25092e4ec0ab3f' => :mavericks
    sha1 '3bbe4b96b8840575538723e9efe08b9d63d8c1e6' => :mountain_lion
    sha1 'f7bb9e3f159d25250cd6eff3f64923787afdde81' => :lion
  end

  def install
    system "make", "all", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
    man1.install gzip("pidof.1")
    bin.install "pidof"
  end
end
