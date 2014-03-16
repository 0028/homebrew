require 'formula'

class Sslh < Formula
  homepage 'http://www.rutschle.net/tech/sslh.shtml'
  url 'https://github.com/yrutschle/sslh/archive/v1.16.tar.gz'
  sha1 '7139672fa8e2fd1befde2e1f9a73ce2ade04920c'

  bottle do
    cellar :any
    sha1 "3e31bc6398a8d663aa9d87fdae5d163e8e9bd4ad" => :mavericks
    sha1 "97bcfd584427e4a311b5ffe19b4827d086256fa7" => :mountain_lion
    sha1 "c547ab8617c36bda61c00a81c75c47573e3bbe43" => :lion
  end

  depends_on 'libconfig'

  def install
    ENV.j1
    system 'make'
    bin.install 'sslh-fork', 'sslh-select'
    ln_s bin/'sslh-fork', bin/'sslh'
    man8.install 'sslh.8.gz'
  end
end
