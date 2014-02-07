require 'formula'

class Quassel < Formula
  homepage 'http://www.quassel-irc.org/'
  url 'http://www.quassel-irc.org/pub/quassel-0.9.2.tar.bz2'
  sha1 'b32c76a4fc608c2e3a86a02456b4f4e996a815b3'

  head 'https://github.com/quassel/quassel.git'

  bottle do
    sha1 "c12702500c2b70b11983870b39b3ba219138f85b" => :mavericks
    sha1 "48c0f51788db89aa9ea34f18b93de2ad99a197c1" => :mountain_lion
    sha1 "877e5d28dcdc70e836dd8b3d56296d822d380815" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'qt'

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
