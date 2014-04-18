require 'formula'

class Play < Formula
  homepage 'http://www.playframework.org/'
  head 'https://github.com/playframework/playframework.git'
  url 'http://downloads.typesafe.com/play/2.2.2/play-2.2.2.zip'
  sha1 '9a2fa3c6b9ee36375d814d775bec4335e427dcd2'

  bottle do
    cellar :any
    sha1 "00cd9a3df1253a51f70b0f71042123cdd9770f12" => :mavericks
    sha1 "4d4a589a7eed034d163d5c6653f2db7b7821d54f" => :mountain_lion
    sha1 "0ca56ed4a43fc08f99bca17c5bcbc65c168a8826" => :lion
  end

  conflicts_with 'sox', :because => 'both install `play` binaries'

  devel do
    url 'http://downloads.typesafe.com/play/2.2.3-RC1/play-2.2.3-RC1.zip'
    sha1 '0c138469a85de56e1f2a288568c793ff2fbc57a3'
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
