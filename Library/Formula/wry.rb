require 'formula'

class Wry < Formula
  homepage 'http://grailbox.com/wry/'
  url 'https://github.com/hoop33/wry/archive/v1.7.1.tar.gz'
  sha1 '5c015d98572f4e96a549f7da5637d5ff863a37d9'

  head 'https://github.com/hoop33/wry.git'

  bottle do
    cellar :any
    sha1 '564744028cac4d07e6025c16429c95a9bcf3da3d' => :mavericks
    sha1 '5ea6e0965e098ad11914c706b49ab1a3135fadfc' => :mountain_lion
    sha1 '94aff5eaea55d124a2e0057ec2dad3b08d9a64fe' => :lion
  end

  depends_on :macos => :lion
  depends_on :xcode

  def install
    system 'xcodebuild -target wry -configuration Release SYMROOT=build OBJROOT=objroot'
    bin.install 'build/Release/wry'
  end
end
