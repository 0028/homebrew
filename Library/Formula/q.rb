require 'formula'

class Q < Formula
  homepage 'https://github.com/harelba/q'
  url 'https://github.com/harelba/q/archive/1.1.7.tar.gz'
  sha1 '088a4f267167481ae0c0825ad410c897aeaab9e8'

  bottle do
    cellar :any
    sha1 "a85cb9662524d2d6fcb10223a04dbd2c809b1f90" => :mavericks
    sha1 "040af3a82815496c8a24601bed519fa2a9a4580e" => :mountain_lion
    sha1 "a6e2f18442c678e9b0a70ee062fc2351ca396be6" => :lion
  end

  def install
    bin.install 'q'
  end
end

