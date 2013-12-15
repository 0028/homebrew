require 'formula'

class RbenvUse < Formula
  homepage 'https://github.com/rkh/rbenv-use'
  url 'https://github.com/rkh/rbenv-use/archive/v1.0.0.tar.gz'
  sha1 '39beb889704bc51213665fd994417ab0668c5f83'

  bottle do
    cellar :any
    sha1 '93a25b86a399df0a067fa80a1da912d1046ba66b' => :mavericks
    sha1 '7827db3b1e72c0d613b2e34c98e67d6af833355b' => :mountain_lion
    sha1 '7a10ed8a9fa799404ba7b0df71f8de8be11d4977' => :lion
  end

  depends_on 'rbenv'
  depends_on 'rbenv-whatis'

  def install
    prefix.install Dir['*']
  end
end
