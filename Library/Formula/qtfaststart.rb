require 'formula'

class Qtfaststart < Formula
  homepage 'http://ffmpeg.org/'
  url 'http://ffmpeg.org/releases/ffmpeg-2.1.1.tar.bz2'
  sha1 'e7a5b2d7f702c4e9ca69e23c6d3527f93de0d1bd'

  bottle do
    cellar :any
    sha1 '87d9c221fedbcdab137a36cbc101c4e34c21e285' => :mavericks
    sha1 'c202cd65add627eae6e16f96650b1514257ca65b' => :mountain_lion
    sha1 'ff563d895e40af4555f547d4f74a253ba11ff2f0' => :lion
  end

  def install
    system ENV.cc, '-o', 'tools/qt-faststart', 'tools/qt-faststart.c'
    bin.install 'tools/qt-faststart'
  end
end
