require 'formula'

class Libuvc < Formula
  homepage 'https://github.com/ktossell/libuvc'
  url 'https://github.com/ktossell/libuvc/archive/v0.0.2.tar.gz'
  sha1 'e0d57007715eaf36c5ebeb8d348488984c681041'

  bottle do
    sha1 '96ec54d1658916548f5d4f5abc320834fefc6c91' => :mavericks
    sha1 'f0b8ab1852fa7f004c3578b2bd3075db039cc09d' => :mountain_lion
    sha1 'f77761e6b63281a37fc4d409f1ae2f60f7a5cc33' => :lion
  end

  depends_on 'libusb'
  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end
end
