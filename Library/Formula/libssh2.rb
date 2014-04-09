require 'formula'

class Libssh2 < Formula
  homepage 'http://www.libssh2.org/'
  url 'http://www.libssh2.org/download/libssh2-1.4.3.tar.gz'
  sha1 'c27ca83e1ffeeac03be98b6eef54448701e044b0'

  bottle do
    cellar :any
    revision 2
    sha1 "ec807afff0a6a9403efee259ea22f0b90d3dee84" => :mavericks
    sha1 "17ccc8d9e64d30593ad0b8f6ee0501f5c5702b5d" => :mountain_lion
    sha1 "e04631ce2c0668cb8202b5cb2ddc5a385640885f" => :lion
  end

  depends_on "openssl"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--with-openssl",
                          "--with-libssl-prefix=#{Formula['openssl'].opt_prefix}",
                          "--with-libz"
    system "make install"
  end
end
