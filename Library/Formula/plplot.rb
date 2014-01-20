require 'formula'

class Plplot < Formula
  homepage 'http://plplot.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/plplot/plplot/5.9.11%20Source/plplot-5.9.11.tar.gz'
  sha1 'cfe7e8085ca054d484b24598636d4a5dcbf357c6'

  bottle do
    sha1 "465b692711067de4e250580ee860ad05831bcf25" => :mavericks
    sha1 "497a2ae1e931c18eaa8837fe5fb95cf1d511b6ac" => :mountain_lion
    sha1 "850292da048012ee8e102b494364f16dd24c4838" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'pango'
  depends_on :x11 => :optional

  option 'with-java'

  def install
    args = std_cmake_args
    args << '-DPLD_wxwidgets=OFF' << '-DENABLE_wxwidgets=OFF'
    args << '-DENABLE_java=OFF' unless build.with? 'java'
    args << '-DPLD_xcairo=OFF' unless MacOS::X11.installed?
    mkdir "plplot-build" do
      system "cmake", "..", *args
      system "make"
      system "make install"
    end
  end
end
