require 'formula'

class Play < Formula
  homepage 'http://www.playframework.org/'
  head 'https://github.com/playframework/playframework.git'
  url 'http://downloads.typesafe.com/play/2.2.1/play-2.2.1.zip'
  sha1 'e4567f3cf61536908d66e85bde48d7e953f0a01f'

  bottle do
    cellar :any
    sha1 "52a5d39b517e3db3ea64d871b9653001b091d472" => :mavericks
    sha1 "30dd369081945c114e57551fe52291910bbd69e3" => :mountain_lion
    sha1 "91f1aab83642f35c095b411fb8751a6eca83d9b0" => :lion
  end

  conflicts_with 'sox', :because => 'both install `play` binaries'

  devel do
    url 'http://downloads.typesafe.com/play/2.2.2-RC2/play-2.2.2-RC2.zip'
    sha1 '30a31d9f01893f4ab57e554aa339994eea20bd51'
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
