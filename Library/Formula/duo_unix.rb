require "formula"

class DuoUnix < Formula
  homepage "https://www.duosecurity.com/docs/duounix"
  url "https://dl.duosecurity.com/duo_unix-1.9.8.tar.gz"
  sha1 "0f7d039c0768e872c56429758ff997c33f5aa030"

  bottle do
    sha1 "27e3ecf0f2ab81e1ce96c7d1059309f0ff357da2" => :mavericks
    sha1 "3e041de7bda03d2572604927ce0b2adb689e7f87" => :mountain_lion
    sha1 "7e4b401c544968a3fe23afc85729ea013c05a31f" => :lion
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
