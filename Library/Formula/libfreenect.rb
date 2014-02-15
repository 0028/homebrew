require 'formula'

class Libfreenect < Formula
  homepage 'http://openkinect.org'
  url 'https://github.com/OpenKinect/libfreenect/archive/v0.4.0.tar.gz'
  sha1 'bec4c9f8a9e5ba39a874680882903858d52574df'

  head 'https://github.com/OpenKinect/libfreenect.git'

  bottle do
    sha1 "332dff7b605b7e5bc47122ef73ccb32505de58dc" => :mavericks
    sha1 "4db4873e44c3ad3e73db395344adbf7676649b77" => :mountain_lion
    sha1 "72e542f7009fb3a10da4207a4c41dc32a6a2f79e" => :lion
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
