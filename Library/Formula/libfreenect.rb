require 'formula'

class Libfreenect < Formula
  homepage 'http://openkinect.org'
  url 'https://github.com/OpenKinect/libfreenect/archive/v0.4.1.tar.gz'
  sha1 'a72bf3d60a859fb5b54b30d6e5d52c8359c07888'

  head 'https://github.com/OpenKinect/libfreenect.git'

  bottle do
    cellar :any
    sha1 "5bef9967d0c05e85b5b62e10f2d808ea3c49c966" => :mavericks
    sha1 "0c96ac09902613ac7da746f98c31c66be2be60d6" => :mountain_lion
    sha1 "7fce9eb5b78ce544aafc5c03cad23ce035b058b6" => :lion
  end

  option :universal

  depends_on 'cmake' => :build
  depends_on 'libusb'

  def install
    if build.universal?
      ENV.universal_binary
      ENV['CMAKE_OSX_ARCHITECTURES'] = Hardware::CPU.universal_archs.as_cmake_arch_flags
    end
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
  end
end
