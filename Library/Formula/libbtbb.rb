require "formula"

class Libbtbb < Formula
  homepage "https://github.com/greatscottgadgets/libbtbb"
  url "https://github.com/greatscottgadgets/libbtbb/archive/2014-02-R2.tar.gz"
  sha1 "aa94b7d92465704aa647123f11e906491a26d090"
  version "2014-02-R2"

  head "https://github.com/greatscottgadgets/libbtbb.git"

  bottle do
    cellar :any
    sha1 "89716afa62e810ef38a3fb5cb737b62d45c7ec80" => :mavericks
    sha1 "b6b8c8106e509de7968f8ac2fba44c6ae2d4098a" => :mountain_lion
    sha1 "fdab9d4621521e2375eda665572c9e2a1feb6847" => :lion
  end

  option :universal

  depends_on "cmake" => :build
  depends_on "python"

  def install
    if build.universal?
      ENV.universal_binary
      ENV["CMAKE_OSX_ARCHITECTURES"] = Hardware::CPU.universal_archs.as_cmake_arch_flags
    end

    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
