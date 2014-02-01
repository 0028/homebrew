require 'formula'

class Kerl < Formula
  homepage 'https://github.com/spawngrid/kerl'
  url 'https://github.com/spawngrid/kerl/archive/f350e80171c1f4f004babe0a7186336ad7a14aa7.zip'
  version '20140131'
  sha1 '9ac26009c2b4b5f059cd5ae338db123127e390e4'

  bottle do
    cellar :any
    sha1 "b16e59685b6e62c9fb7f5f184a02cf1bf434ced1" => :mavericks
    sha1 "bb1c6b7778da6e3971cbd77433e7bcd33f52f965" => :mountain_lion
    sha1 "cf4574f3241d068e94af51eddfa053b1bd9c33ce" => :lion
  end

  def install
    bin.install 'kerl'
    bash_completion.install 'bash_completion/kerl'
  end
end
