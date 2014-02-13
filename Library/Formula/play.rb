require 'formula'

class Play < Formula
  homepage 'http://www.playframework.org/'
  head 'https://github.com/playframework/playframework.git'
  url 'http://downloads.typesafe.com/play/2.2.1/play-2.2.1.zip'
  sha1 'e4567f3cf61536908d66e85bde48d7e953f0a01f'

  bottle do
    cellar :any
    sha1 "fee40b9aac89f34bb8ccfcb12cb540206ac03944" => :mavericks
    sha1 "eb7aee422e4a73a5f20f1b3de4b0b5bac3853d40" => :mountain_lion
    sha1 "6b5ca0f853e091b545b1ef0326ba16c95e07adb1" => :lion
  end

  conflicts_with 'sox', :because => 'both install `play` binaries'

  devel do
    url 'http://downloads.typesafe.com/play/2.2.2-RC3/play-2.2.2-RC3.zip'
    sha1 '5f91b9b38b279f07425d9b8a1a718edbf6a9d293'
  end

  def install
    system "./framework/build", "publish-local" if build.head?

    # remove Windows .bat files
    rm Dir['*.bat']
    rm Dir["#{buildpath}/**/*.bat"] if build.head?

    libexec.install Dir['*']
    bin.install_symlink libexec/'play'
  end
end
