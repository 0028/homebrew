require 'formula'

class Libftdi < Formula
  homepage 'http://www.intra2net.com/en/developer/libftdi'
  url 'http://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.1.tar.bz2'
  sha1 'f05ade5614aa31e64f91a30ce3782f7ca3704d18'

  bottle do
    sha1 "95bdcdbd71f69aa90fedd96bb25bb609d8f2a924" => :mavericks
    sha1 "13a20ebd90f1a06fd887a86cf9c54e5fa380b1e6" => :mountain_lion
    sha1 "4519d1e847056940f9d0afbd87de8c80af355895" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'libusb'
  depends_on 'boost' => :optional

  def install
    mkdir 'libftdi-build' do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
  end
end
