require 'formula'

class RbenvCommunalGems < Formula
  homepage 'https://github.com/tpope/rbenv-communal-gems'
  url 'https://github.com/tpope/rbenv-communal-gems/archive/v1.0.1.tar.gz'
  sha1 '39360238e89f2d723409c3de2a4132f561de7bb9'

  bottle do
    cellar :any
    sha1 '6c7f4f0ede95dae7c9e7fff466282c9c16eda673' => :mavericks
    sha1 'f320c767abb16dc1ad13896eedcc3aa7d9aaf131' => :mountain_lion
    sha1 'a6c59205a61f4b3212243c338993a0b531ec2412' => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
