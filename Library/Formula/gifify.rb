require 'formula'

class Gifify < Formula
  homepage 'https://github.com/jclem/gifify'
  url 'https://github.com/jclem/gifify/archive/v1.0.tar.gz'
  sha1 '7179e5738db1be9030523e6db5144ba7f5f42d84'

  head 'https://github.com/jclem/gifify.git'

  bottle do
    cellar :any
    sha1 '393172ffc3f087308987aa84a4e7a94283c81e2d' => :mavericks
    sha1 '09427d34c8b3622c3b20b92ba8b20cc5ba5651b1' => :mountain_lion
    sha1 '7bb319827d49a50edfc59c656f2aceb005158dde' => :lion
  end

  depends_on 'ffmpeg'
  depends_on 'imagemagick'

  def install
    bin.install 'gifify.sh' => 'gifify'
  end

  def caveats; <<-EOS.undent
    To allow uploading to CloudApp, run:
      gem install cloudapp
    EOS
  end
end
