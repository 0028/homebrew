require 'formula'

class Openjpeg < Formula
  homepage 'http://www.openjpeg.org/'
  url 'https://openjpeg.googlecode.com/files/openjpeg-2.0.0.tar.gz'
  sha1 '0af78ab2283b43421458f80373422d8029a9f7a7'
  bottle do
    cellar :any
    sha1 "1711537db1d39776eee65f4ce2975fa8d9a581fd" => :mavericks
    sha1 "2e434a426e704dea8f791ced801adec3e1751e33" => :mountain_lion
    sha1 "510545749f1ef410f596f912887bca9a7037c894" => :lion
  end

  revision 1

  head 'http://openjpeg.googlecode.com/svn/trunk/'

  depends_on 'cmake' => :build
  depends_on 'little-cms2'
  depends_on 'libtiff'
  depends_on 'libpng'

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DCMAKE_INSTALL_PREFIX=#{prefix}"

    cmake_args << "."

    system "cmake", *cmake_args
    system "make install"
  end
end
