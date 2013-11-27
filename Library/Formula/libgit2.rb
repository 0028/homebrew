require 'formula'

class Libgit2 < Formula
  homepage 'http://libgit2.github.com/'
  url 'https://github.com/libgit2/libgit2/archive/v0.20.0.tar.gz'
  sha1 '811bbe4fe4fc83236ba42d23e3b449f1b95b4bab'

  bottle do
    cellar :any
    sha1 '3776440a043812899b156444ee9656c9145344ef' => :mavericks
    sha1 'efaa9cfc1a9a97036e0dfc8f49e590b8c76d5b0f' => :mountain_lion
    sha1 '5b6c1a6a3f4769e651bb3bfc7cc797ba8a6b43ed' => :lion
  end

  head 'https://github.com/libgit2/libgit2.git', :branch => 'development'

  depends_on 'cmake' => :build

  def install
    mkdir 'build' do
      system "cmake", "..",
                      "-DBUILD_TESTS=NO",
                      *std_cmake_args
      system "make install"
    end
  end
end
