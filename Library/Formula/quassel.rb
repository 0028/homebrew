require 'formula'

class Quassel < Formula
  homepage 'http://www.quassel-irc.org/'
  url 'http://quassel-irc.org/pub/quassel-0.10.0.tar.bz2'
  sha1 '305d56774b1af2a891775a5637174d9048d875a7'

  head 'https://github.com/quassel/quassel.git'

  bottle do
    sha1 "84ff574e01e1533fd7a54dc0c08b26873f004744" => :mavericks
    sha1 "b655b04792c316ca7025126d311185848dfcbf3f" => :mountain_lion
    sha1 "f4ffdd840409d7dfc044ff92355e8f5b9fc54123" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'qt'

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
