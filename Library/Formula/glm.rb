require 'formula'

class Glm < Formula
  homepage 'http://glm.g-truc.net/'
  url 'http://downloads.sourceforge.net/project/ogl-math/glm-0.9.5.1/glm-0.9.5.1.zip'
  sha1 'e1165e2c1be99e3cfeacbecaa15a2c89f2caf503'
  head 'https://github.com/Groovounet/glm.git'

  bottle do
    cellar :any
    sha1 'f74041006a7f5cb6af4e80d25b4562f38da6abf5' => :mavericks
    sha1 '50615d66917a5882973170c5a86a0957f48e8d23' => :mountain_lion
    sha1 '07e12ecbe304d5c909d9ba958f8843d21dc7af9e' => :lion
  end

  def install
    include.install 'glm'
  end
end
