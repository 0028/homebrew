require 'formula'

class NoExpatFramework < Requirement
  def expat_framework
    '/Library/Frameworks/expat.framework'
  end

  satisfy :build_env => false do
    not File.exist? expat_framework
  end

  def message; <<-EOS.undent
    Detected #{expat_framework}

    This will be picked up by CMake's build system and likely cause the
    build to fail, trying to link to a 32-bit version of expat.

    You may need to move this file out of the way to compile CMake.
    EOS
  end
end

class Cmake < Formula
  homepage 'http://www.cmake.org/'
  url 'http://www.cmake.org/files/v2.8/cmake-2.8.12.1.tar.gz'
  sha1 '5661a607acbce7c16bb5f15ff2895fa5ca53a4da'

  head 'http://cmake.org/cmake.git'

  bottle do
    cellar :any
    revision 2
    sha1 'b1feef99104e2792d9eb19fee20e8ddc850a1904' => :mavericks
    sha1 'b4185d288c063079c9a1ce3723df87ebbeba75c8' => :mountain_lion
    sha1 'ccf5900c1d7c013f453d2875c6c26b2cd08c9d31' => :lion
  end

  depends_on NoExpatFramework

  def install
    args = %W[
      --prefix=#{prefix}
      --system-libs
      --no-system-libarchive
      --datadir=/share/cmake
      --docdir=/share/doc/cmake
      --mandir=/share/man
      --
      -DCMAKE_BUILD_TYPE:STRING=RELEASE
    ]

    system "./bootstrap", *args
    system "make"
    system "make install"
  end

  test do
    (testpath/'CMakeLists.txt').write('find_package(Ruby)')
    system "#{bin}/cmake", '.'
  end
end
