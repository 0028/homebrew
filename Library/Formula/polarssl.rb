require 'formula'

class Polarssl < Formula
  homepage 'http://polarssl.org/'
  url 'https://polarssl.org/download/polarssl-1.3.4-gpl.tgz'
  sha1 'e43dc467e36ae2761ca2e4fa02c54f5771ee51a1'

  bottle do
    cellar :any
    sha1 "228dab5aeea0e907c36145098aa41e0d0527fe71" => :mavericks
    sha1 "76aac20b6b64b71cb2e05e5f89a39d2e32449659" => :mountain_lion
    sha1 "6fb6596cebc430f1a33539f4e139591b0269cf1c" => :lion
  end

  depends_on 'cmake' => :build

  conflicts_with 'md5sha1sum', :because => 'both install conflicting binaries'

  def install
    system "cmake", ".",  *std_cmake_args
    system "make"
    system "make install"
  end
end
