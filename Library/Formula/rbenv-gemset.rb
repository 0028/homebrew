require 'formula'

class RbenvGemset < Formula
  homepage 'https://github.com/jf/rbenv-gemset'
  url 'https://github.com/jf/rbenv-gemset/archive/v0.5.0.tar.gz'
  sha1 '72f59463d6c7ef95b66309beea59d0289deb6c86'

  head 'https://github.com/jf/rbenv-gemset.git'

  bottle do
    cellar :any
    sha1 'c85b74ba12623038d996d898b14419c83161c9be' => :mavericks
    sha1 'fe802691d7cf5a4a2e64dfa72ce8751c66ab4131' => :mountain_lion
    sha1 '1425e68d9c8c937784a22c9e81c04e5e70a08df1' => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
