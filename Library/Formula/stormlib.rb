require "formula"

class Stormlib < Formula
  homepage "http://www.zezula.net/en/mpq/stormlib.html"
  url "http://www.zezula.net/download/stormlib-9.00.zip"
  sha1 "d1c4f458c0f7a87843c983cf2823cfcea45f3cec"
  head "https://github.com/stormlib/StormLib.git"

  bottle do
    cellar :any
    sha1 "3798f0a6bf82270e06f94e280db2c77260c4f126" => :mavericks
    sha1 "8c512b34b84099ffab2d0ad7ec6b7a0a74648dc7" => :mountain_lion
    sha1 "d204a6dbaee8ac10b529cc93a512d763713c99f8" => :lion
  end

  depends_on "cmake" => :build

  def install
    inreplace "CMakeLists.txt" do |s|
      s.gsub! /\/Library\/Frameworks/, "lib/"
    end
    system "cmake", ".", *std_cmake_args
    system "make install"
    lib.install_symlink lib/'storm.framework' => 'storm.framework'
  end

end
