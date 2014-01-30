require 'formula'

class Irrlicht < Formula
  homepage 'http://irrlicht.sourceforge.net/'
  head 'https://irrlicht.svn.sourceforge.net/svnroot/irrlicht/trunk'
  url 'http://downloads.sourceforge.net/irrlicht/irrlicht-1.8.1.zip'
  sha1 '231cd2cf2eefe43bde7c40537ece055a3d6e09cb'

  bottle do
    cellar :any
    sha1 "de15ea96155deb3bf8992f812b1b71fe572a3de3" => :mavericks
    sha1 "ac1476a6c7048e10638d5986483be40e151b10ac" => :mountain_lion
    sha1 "d0af11031819fe08eead183fe726c31c118bf0ee" => :lion
  end

  depends_on :xcode

  def install
    system *%W(xcodebuild -project source/Irrlicht/MacOSX/MacOSX.xcodeproj -configuration Release -target libIrrlicht.a)
    lib.install "source/Irrlicht/MacOSX/build/Release/libIrrlicht.a"
    include.install "include" => "irrlicht"
  end
end
