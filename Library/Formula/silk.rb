require 'formula'

class Silk < Formula
  homepage 'http://tools.netsa.cert.org/silk/'
  url 'http://tools.netsa.cert.org/releases/silk-3.8.0.tar.gz'
  sha1 '5f3887fcc7147cc5a86cdd6ffa73854b93eb24d0'

  bottle do
    sha1 'fd90575dae921ccb808be4c32be2f6b7ce2ea61a' => :mavericks
    sha1 '0f6743e267c27886b70063779a87f296317b80ef' => :mountain_lion
    sha1 '3e960379e271e5e8411ced35a0af9b6d02db26dd' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'libfixbuf'
  depends_on 'yaf'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--enable-ipv6",
                          "--enable-data-rootdir=#{var}/silk"
    system "make"
    system "make install"

    (var+"silk").mkpath
  end
end
