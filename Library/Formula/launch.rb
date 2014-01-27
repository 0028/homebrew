require 'formula'

class Launch < Formula
  homepage 'http://web.sabi.net/nriley/software/'
  url 'http://sabi.net/nriley/software/launch-1.2.1.tar.gz'
  sha1 'c9d8034da5778ee973bf64c3d3acc19e143730bd'

  head 'https://github.com/nriley/launch.git'

  bottle do
    cellar :any
    sha1 "2e3d16124283244d050bae508a8bb923e7d80989" => :mavericks
    sha1 "2123e3026b75bc2bedecf588ec9f47c819d530cb" => :mountain_lion
    sha1 "e521d881938995c358262adb05895663d90d729e" => :lion
  end

  def install
    rm_rf "launch" # We'll build it ourself, thanks.
    system  "xcodebuild",
            "-configuration",
            "Deployment",
            " SYMROOT=build clean"
    system  "xcodebuild",
            "-configuration",
            "Deployment",
            "SYMROOT=build"
    man1.install gzip('launch.1')
    bin.install 'build/Deployment/launch'
  end
end
