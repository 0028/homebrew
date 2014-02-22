require 'formula'

class Libssh2 < Formula
  homepage 'http://www.libssh2.org/'
  url 'http://www.libssh2.org/download/libssh2-1.4.3.tar.gz'
  sha1 'c27ca83e1ffeeac03be98b6eef54448701e044b0'

  bottle do
    cellar :any
    sha1 "0d38ac3b4db82e310fc9b55c847c87c0c797fa3a" => :mavericks
    sha1 "715c2ea94385aa3a10d645d5999f4a9a9af0ca73" => :mountain_lion
    sha1 "ad97a3c0e175383d1717e5108497f460252f1b89" => :lion
  end

  depends_on 'openssl' => :recommended

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--with-libz",
                          "--with-openssl"
    system "make install"
  end
end
