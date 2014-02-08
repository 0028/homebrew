require 'formula'

class Kerl < Formula
  homepage 'https://github.com/spawngrid/kerl'
  url 'https://github.com/spawngrid/kerl/archive/f350e80171c1f4f004babe0a7186336ad7a14aa7.zip'
  version '20140201'
  sha1 '9ac26009c2b4b5f059cd5ae338db123127e390e4'

  bottle do
    cellar :any
    sha1 "5bfc8b42e072a67be9e61b19df06c58bd8b98592" => :mavericks
    sha1 "24aa30e6b1453c332f51ee7b04dc7ba1171f221c" => :mountain_lion
    sha1 "bc78695e6adfdab2560e28ce45b4248fed285f94" => :lion
  end

  def install
    bin.install 'kerl'
    bash_completion.install 'bash_completion/kerl'
    zsh_completion.install 'zsh_completion/_kerl'
  end
end
