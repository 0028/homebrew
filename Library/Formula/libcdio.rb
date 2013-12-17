require 'formula'

class Libcdio < Formula
  homepage 'http://www.gnu.org/software/libcdio/'
  url 'http://ftpmirror.gnu.org/libcdio/libcdio-0.92.tar.gz'
  bottle do
    cellar :any
    sha1 '1299165a57e8c5421e193e8e7475d57f9fc7b636' => :mavericks
    sha1 '7600f52447e3b2974153130201b08fa4df87d38c' => :mountain_lion
    sha1 '3f1d66fdfddb1d034e9c0fc3c19e59f4aac090f1' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/libcdio/libcdio-0.92.tar.gz'
  sha1 '530031897955729ddb7c850c183f234f7a6516b7'

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
