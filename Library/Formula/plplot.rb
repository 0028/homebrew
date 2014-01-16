require 'formula'

class Plplot < Formula
  homepage 'http://plplot.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/plplot/plplot/5.9.11%20Source/plplot-5.9.11.tar.gz'
  sha1 'cfe7e8085ca054d484b24598636d4a5dcbf357c6'

  bottle do
    sha1 'b1fa194f8e04a5e15a2d32ecb1177f7c99b68b4a' => :mavericks
    sha1 '694bf5d97a240ba748800bad27d01ba49963e036' => :mountain_lion
    sha1 'abd8f5cbd1beaf3716c57400f9811a14b0eb09c1' => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'pango'

  option 'with-java'

  def install
    args = std_cmake_args
    args << '-DPLD_wxwidgets=OFF' << '-DENABLE_wxwidgets=OFF'
    args << '-DENABLE_java=OFF' unless build.with? 'java'
    mkdir "plplot-build" do
      system "cmake", "..", *args
      system "make"
      system "make install"
    end
  end
end
