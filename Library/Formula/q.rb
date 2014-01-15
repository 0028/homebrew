require 'formula'

class Q < Formula
  homepage 'https://github.com/harelba/q'
  url 'https://github.com/harelba/q/archive/1.1.5.tar.gz'
  sha1 'f64cb6797c73950b28c404389a3efe2d086d081d'

  bottle do
    cellar :any
    sha1 'b47edb957d64d319847669b7bab529b94b499b42' => :mavericks
    sha1 '2fd7a3cb976b348bbaed5ec3d409b68481ea7d51' => :mountain_lion
    sha1 '8aa43a852c7c46f7bdb01274c92fdb8d4eb56555' => :lion
  end

  def install
    bin.install 'q'
  end
end

