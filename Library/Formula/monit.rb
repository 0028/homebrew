require 'formula'

class Monit < Formula
  homepage 'http://mmonit.com/monit/'
  url 'http://mmonit.com/monit/dist/monit-5.7.tar.gz'
  sha256 'bb250ab011d805b5693972afdf95509e79bb3b390caa763275c9501f74b598a2'

  bottle do
    cellar :any
    sha1 "e19aa5717a795ddccda618b081dab23b4ca35e27" => :mavericks
    sha1 "8694039c3c819c6d3534536693ae34f2ce1a1b28" => :mountain_lion
    sha1 "5c1133225c9db1d364a3fb266cbcff76e29d624c" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--localstatedir=#{var}/monit",
                          "--sysconfdir=#{etc}/monit"
    system "make install"
  end

  test do
    system "#{bin}/monit", "-h"
  end
end
