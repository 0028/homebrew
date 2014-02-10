require 'formula'

class Libssh < Formula
  homepage 'http://www.libssh.org/'
  url 'http://git.libssh.org/projects/libssh.git/snapshot/libssh-0.6.1.tar.gz'
  sha1 '2ad5f0afc9983291d3639812212f0f8babc1ba81'

  bottle do
    sha1 "44c674c2f5472e590973f6bee2dae1645d066d53" => :mavericks
    sha1 "9528741b1a90725aeaa51ff725014b8ba015cff1" => :mountain_lion
    sha1 "1163d974126b8d017fca007cf456df22363d2ff1" => :lion
  end

  depends_on 'cmake' => :build

  def install
    cd 'build' do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
  end
end
