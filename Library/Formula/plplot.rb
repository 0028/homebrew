require 'formula'

class Plplot < Formula
  homepage 'http://plplot.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/plplot/plplot/5.9.10%20Source/plplot-5.9.10.tar.gz'
  sha1 '10dbdfe41d71a9f51e4396729c001ed2baea22fe'

  bottle do
    sha1 '70691fcc29527a9a342be6e9249a639c26604c66' => :mavericks
    sha1 'e73555fd025e63b10be9658995318718feea0b13' => :mountain_lion
    sha1 '32ff958d7c4d7c3a19494edc64e027ae4b7e7ba9' => :lion
  end

  # failing wxWidget includes on snow leopard
  depends_on :macos => :lion
  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'pango'

  option 'with-java'

  def install
    args = std_cmake_args
    args << '-DENABLE_java=OFF' unless build.with? 'java'
    mkdir "plplot-build" do
      system "cmake", "..", *args
      system "make"
      system "make install"
    end
  end
end
