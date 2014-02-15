require 'formula'

class Glm < Formula
  homepage 'http://glm.g-truc.net/'
  url 'http://downloads.sourceforge.net/project/ogl-math/glm-0.9.5.2/glm-0.9.5.2.zip'
  sha1 '647736ff89bde9543ce20c1a4497674f9fbf6ab9'
  head 'https://github.com/Groovounet/glm.git'

  bottle do
    cellar :any
    sha1 "c2e5a2482c2ee48573355d55660b1eac00710f6c" => :mavericks
    sha1 "396ac38db88b5e3a0d5a50a937b780acbebbf481" => :mountain_lion
    sha1 "c1bbb9756480021947e2f7e7b5f92eeb2583af0e" => :lion
  end

  def install
    include.install 'glm'
  end
end
