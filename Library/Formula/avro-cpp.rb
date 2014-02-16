require 'formula'

class AvroCpp < Formula
  homepage 'http://avro.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=avro/avro-1.7.6/cpp/avro-cpp-1.7.6.tar.gz'
  sha1 '6ef420797e14998d0889b1d6b34cd8d93480a332'

  bottle do
    cellar :any
    sha1 "f7c845b2022729707e2372b19b4f77f3a109303e" => :mavericks
    sha1 "d89bb8a03101d0358f8129afeb12e1babd902c87" => :mountain_lion
    sha1 "027fb2bbcb90bba78ef35d4f4bbf52f178b7ad4a" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'boost'

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
