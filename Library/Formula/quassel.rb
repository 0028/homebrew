require 'formula'

class Quassel < Formula
  homepage 'http://www.quassel-irc.org/'
  url 'http://www.quassel-irc.org/pub/quassel-0.9.1.tar.bz2'
  sha1 '82bc8ad2f5c0d61a8ec616b84df0504589f19371'

  head 'https://github.com/quassel/quassel.git'

  bottle do
    sha1 '2ed6c5e2ca3bc942b7eb4226e99b0097814bf494' => :mavericks
    sha1 'a610e2bab39f274b22b1e67ba6f5565b4fdedf59' => :mountain_lion
    sha1 '2c49ac3b28a8401a4c1356d1e01ebeaf67a16599' => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'qt'

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
