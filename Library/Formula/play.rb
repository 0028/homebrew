require 'formula'

class Play < Formula
  homepage 'http://www.playframework.org/'
  head 'https://github.com/playframework/playframework.git'
  url 'http://downloads.typesafe.com/play/2.2.2/play-2.2.2.zip'
  sha1 '9a2fa3c6b9ee36375d814d775bec4335e427dcd2'

  bottle do
    cellar :any
    sha1 "a732960915e95d05badcc5296626ccdfc808015b" => :mavericks
    sha1 "9c2fc60def65e0f444e5e86bd5f18b1a91cd6fef" => :mountain_lion
    sha1 "091d42394633ff4f4b0fc40e1a7f3a62f036547c" => :lion
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
