require "formula"

class Libbtbb < Formula
  homepage "https://github.com/greatscottgadgets/libbtbb"
  url "https://github.com/greatscottgadgets/libbtbb/archive/2014-02-R1.tar.gz"
  sha1 "d0004f7d7afdee949cd7ddf0e3f13510861a9c7d"
  version "2014-02-R1"

  head "https://github.com/greatscottgadgets/libbtbb.git"

  bottle do
    sha1 "5f33d0a630f2bd6ae4eca9577b77a2b047ba03c6" => :mavericks
    sha1 "de4945d8e0bf0b8cbbaa71a01840f28f192d5ce0" => :mountain_lion
    sha1 "984da2103ff4ce1e9fe910ec30f39de2f831c6a6" => :lion
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
