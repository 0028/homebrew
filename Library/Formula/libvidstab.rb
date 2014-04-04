require "formula"

class Libvidstab < Formula
  homepage "http://public.hronopik.de/vid.stab/"
  url "https://github.com/georgmartius/vid.stab/archive/release-0.98b.tar.gz"
  sha1 "1030a1baa9b2cba844758a6cd8dd5d5fc23f9cd9"

  bottle do
    cellar :any
    sha1 "4ee82c8d9ac3009ea80dc44ae75fe04f037a4f57" => :mavericks
    sha1 "a0f436ef16f9a5b272133aef8bddd367f09b9c82" => :mountain_lion
    sha1 "c0ed37a5b77f2dabacca442604be755842ccb147" => :lion
  end

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
