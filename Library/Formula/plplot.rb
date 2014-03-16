require 'formula'

class Plplot < Formula
  homepage 'http://plplot.sourceforge.net'
  url 'https://downloads.sourceforge.net/project/plplot/plplot/5.10.0%20Source/plplot-5.10.0.tar.gz'
  sha1 'ea962cb0138c9b4cbf97ecab1fac1919ea0f939f'

  bottle do
    sha1 "804afe9c641549e1a4c93f821a840d713a1b6848" => :mavericks
    sha1 "629c7cec9a21c7bd4bf73c280afcdc12e65bbaca" => :mountain_lion
    sha1 "4e1c9bacd5bf6196db89895c4f33ba585460d76f" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'pango'
  depends_on :x11 => :optional

  option 'with-java'

  def install
    args = std_cmake_args
    args << '-DPLD_wxwidgets=OFF' << '-DENABLE_wxwidgets=OFF'
    args << '-DENABLE_java=OFF' if build.without? 'java'
    args << '-DPLD_xcairo=OFF' unless MacOS::X11.installed?
    mkdir "plplot-build" do
      system "cmake", "..", *args
      system "make"
      system "make install"
    end
  end
end
