require "formula"

class DuoUnix < Formula
  homepage "https://www.duosecurity.com/docs/duounix"
  url "https://dl.duosecurity.com/duo_unix-1.9.10.tar.gz"
  sha1 "13977071bdcb24b5d9de13e4fe1a973d60885b37"

  bottle do
    sha1 "566b8e39c00f04851b88424ff8da34cd06d23680" => :mavericks
    sha1 "ed3bba9d238ce41b5ed22a9e2cc7ebf0b0d65e9c" => :mountain_lion
    sha1 "a6b430bb6f7e1dcd94bd47633db842f4f34f25d7" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}"
    system "make", "install"
  end

  test do
    system "#{sbin}/login_duo", "-d", "-c", "#{etc}/login_duo.conf", "-f", "foobar", "echo", "SUCCESS"
  end
end
