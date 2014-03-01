require "formula"

class Itpp < Formula
  homepage "http://itpp.sourceforge.net"
  head "http://git.code.sf.net/p/itpp/git"
  url "http://sourceforge.net/projects/itpp/files/itpp/4.3.1/itpp-4.3.1.tar.bz2/download"
  sha1 "955784bcfb61481e47d8c788a62cea8d78d175cb"

  bottle do
    cellar :any
    sha1 "7fcceb7161362c176df3071471e33b977ae1dde7" => :mavericks
    sha1 "ab70b042c578bad57813d8e628c8fde8f01ba2ee" => :mountain_lion
    sha1 "c545f27bf3dca7ca879e8dac059eccdcaa6e7e5f" => :lion
  end

  depends_on "cmake" => :build
  depends_on "fftw" => :recommended

  def install
    mkdir 'build' do
      args = std_cmake_args
      args.delete '-DCMAKE_BUILD_TYPE=None'
      args << '-DCMAKE_BUILD_TYPE=Release'
      system "cmake", "..", *args
      system "make"
      system "make install"
    end
  end
end
