require 'formula'

class Irrlicht < Formula
  homepage 'http://irrlicht.sourceforge.net/'
  head 'https://irrlicht.svn.sourceforge.net/svnroot/irrlicht/trunk'
  url 'http://downloads.sourceforge.net/irrlicht/irrlicht-1.8.1.zip'
  sha1 '231cd2cf2eefe43bde7c40537ece055a3d6e09cb'

  bottle do
    cellar :any
    sha1 "562765abcbb5b9d7d6977a96378738c3ff129b06" => :mavericks
    sha1 "25c5068a2ab06688e15f930fef49d28ff460540d" => :mountain_lion
    sha1 "6f2f15bac9364a00ae243aa00ddd3e70b1d162e4" => :lion
  end

  depends_on :xcode

  def install
    args = %W(-project source/Irrlicht/MacOSX/MacOSX.xcodeproj -configuration Release -target libIrrlicht.a)
    args << 'SYMROOT=build'
    args << '-sdk' << "macosx#{MacOS.version}"
    system 'xcodebuild', *args
    lib.install "source/Irrlicht/MacOSX/build/Release/libIrrlicht.a"
    include.install "include" => "irrlicht"
  end
end
