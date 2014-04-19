require 'formula'

class Depqbf < Formula
  homepage 'http://lonsing.github.io/depqbf/'
  url 'https://github.com/lonsing/depqbf/archive/version-3.01.tar.gz'
  sha1 '7f1dc19f07fc0fa607724d1b7b124d5f2620acee'
  head 'https://github.com/lonsig/depqbf.git'

  bottle do
    cellar :any
    sha1 "d1609b988a3401ef04a165ad270eeb8a1cf5766e" => :mavericks
    sha1 "be850c4867256c7ce8b57ea64f871479d3fe50db" => :mountain_lion
    sha1 "0abacf64e19bc3c19e1b761781b5a09a6baf47f3" => :lion
  end

  def install
    system "make"
    bin.install "depqbf"
  end
end
