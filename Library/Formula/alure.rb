require 'formula'

class Alure < Formula
  homepage 'http://kcat.strangesoft.net/alure.html'
  url 'http://kcat.strangesoft.net/alure-releases/alure-1.2.tar.bz2'
  sha1 'f033f0820c449ebff7b4b0254a7b1f26c0ba485b'

  bottle do
    cellar :any
    sha1 "09da19f3f4b377e266978c4b54ac36db28637a13" => :mavericks
    sha1 "cf8db8ce48d0ec8770ac3516c0433ed5d2baf796" => :mountain_lion
    sha1 "aca00ea0b81422cf1182742e03a4c0f5b2e80e88" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'cmake' => :build
  depends_on 'flac'       => :optional
  depends_on 'fluid-synth' => :optional
  depends_on 'libogg'     => :optional
  depends_on 'libsndfile' => :optional
  depends_on 'libvorbis'  => :optional
  depends_on 'mpg123'     => :optional

  def install
    # fix a broken include flags line, which fixes a build error.
    # Not reported upstream.
    # https://github.com/Homebrew/homebrew/pull/6368
    inreplace 'CMakeLists.txt', '${VORBISFILE_CFLAGS}',
                                %x[pkg-config --cflags vorbisfile].chomp

    cd "build" do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
  end
end
