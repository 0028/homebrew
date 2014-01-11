require 'formula'

class Polarssl < Formula
  homepage 'http://polarssl.org/'
  url 'https://polarssl.org/download/polarssl-1.3.3-gpl.tgz'
  sha1 'c1072e97b21e94721b8d37509a589ea10249fdbd'

  bottle do
    cellar :any
    sha1 '52a6115470a4a7013cdacd1903b78ffb74a30272' => :mavericks
    sha1 '83c13714518637a870ef1e7da78596b4ca063382' => :mountain_lion
    sha1 'cea05caba847b1331b88d9668f74a54f09622357' => :lion
  end

  depends_on 'cmake' => :build

  conflicts_with 'md5sha1sum', :because => 'both install conflicting binaries'

  def install
    system "cmake", ".",  *std_cmake_args
    system "make"
    system "make install"
  end
end
