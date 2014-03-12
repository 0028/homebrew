require 'formula'

class Chipmunk < Formula
  homepage 'http://chipmunk-physics.net/'
  url 'https://chipmunk-physics.net/release/Chipmunk-6.x/Chipmunk-6.2.1.tgz'
  sha1 '593a15a9032586e56b16d22d84f4f04c1f11a44e'

  bottle do
    cellar :any
    sha1 "0045b6879c5c4e36ff568c674c0c6009a6a1012e" => :mavericks
    sha1 "12009dbc161e1b9c685932391666eef037e9fdfd" => :mountain_lion
    sha1 "7205b782e3f439c724f0ab65c16323a4daf2c506" => :lion
  end

  depends_on 'cmake' => :build

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}",
                    "-DCMAKE_PREFIX_PATH=#{prefix}",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DBUILD_DEMOS=OFF",
                    "-DPREFIX=#{prefix}",
                    "."
    system "make install"
  end
end
