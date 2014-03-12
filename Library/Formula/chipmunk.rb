require 'formula'

class Chipmunk < Formula
  homepage 'http://chipmunk-physics.net/'
  url 'https://chipmunk-physics.net/release/Chipmunk-6.x/Chipmunk-6.2.1.tgz'
  sha1 '593a15a9032586e56b16d22d84f4f04c1f11a44e'

  bottle do
    cellar :any
    sha1 "69b6bc2a3c9e4dbc96ef209f39519db33f101bac" => :mavericks
    sha1 "a3f10186c95108d76055e789809f444d81aa0d75" => :mountain_lion
    sha1 "7b9a678e22a6d82d86acc2a1b6395d692046b232" => :lion
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
