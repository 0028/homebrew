require 'formula'

class Depqbf < Formula
  homepage 'http://lonsing.github.io/depqbf/'
  url 'https://github.com/lonsing/depqbf/archive/version-3.0.tar.gz'
  sha1 '4dbce430731ba0424b24f3960b932fe2984eb452'
  head 'https://github.com/lonsig/depqbf.git'

  bottle do
    cellar :any
    sha1 "472989b5cd92b30754aa0fb6dc5e6e8cb854d24d" => :mavericks
    sha1 "4370bfd5eb7a12dfef6147b908ee88da20fef293" => :mountain_lion
    sha1 "99ffaa9158d7ee6339334be5aae22160deea877c" => :lion
  end

  def install
    system "make"
    bin.install "depqbf"
  end
end
