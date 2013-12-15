require 'formula'

class Libcdio < Formula
  homepage 'http://www.gnu.org/software/libcdio/'
  url 'http://ftpmirror.gnu.org/libcdio/libcdio-0.91.tar.gz'
  bottle do
    cellar :any
    sha1 'e516de177490b9af5810f7e474bc6205c6632f6d' => :mavericks
    sha1 '5aa9040d422eb970e2f0c179b0dab513ab084d8c' => :mountain_lion
    sha1 '557cbdbe74f93d2ddbf21867af6d88e301c0e908' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/libcdio/libcdio-0.91.tar.gz'
  sha1 '898ae74c3cb78ea1afbb0a387fd0eedee999327b'

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
