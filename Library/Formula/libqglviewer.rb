require 'formula'

class Libqglviewer < Formula
  homepage 'http://www.libqglviewer.com/'
  url 'http://www.libqglviewer.com/src/libQGLViewer-2.5.1.tar.gz'
  sha1 '21e10a28153cb649e29bbe9a288eecc280b30f0e'

  head 'https://github.com/GillesDebunne/libQGLViewer.git'

  bottle do
    cellar :any
    revision 1
    sha1 "6169d8c40e9fb9d6b2c7973d737d539945c84307" => :mavericks
    sha1 "1523eec7cddfd3ab4d0240b9750007aa6c561128" => :mountain_lion
    sha1 "5c789d77e505c835ab12c8537e50af52c8314699" => :lion
  end

  option :universal

  depends_on 'qt'

  def install
    args = ["PREFIX=#{prefix}"]
    args << "CONFIG += x86 x86_64" if build.universal?

    cd 'QGLViewer' do
      system "qmake", *args
      system "make"
    end
  end
end
