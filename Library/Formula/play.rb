require 'formula'

class Play < Formula
  homepage 'http://www.playframework.org/'
  head 'https://github.com/playframework/playframework.git'
  url 'http://downloads.typesafe.com/play/2.2.1/play-2.2.1.zip'
  sha1 'e4567f3cf61536908d66e85bde48d7e953f0a01f'

  bottle do
    cellar :any
    sha1 "b3b96440fbcd4a24c90cf906ecf7aa288d0c566a" => :mavericks
    sha1 "a68006adebc5153e8f4e22adb8148ffb48088421" => :mountain_lion
    sha1 "8c5ffa4befa52c751c357c19ba0f7cadb56f9b7e" => :lion
  end

  conflicts_with 'sox', :because => 'both install `play` binaries'

  devel do
    url 'http://downloads.typesafe.com/play/2.2.2-RC4/play-2.2.2-RC4.zip'
    sha1 '4de17ab705ac04374ec7f7921d350536b7b13a1e'
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
