require 'formula'

class Wrk < Formula
  homepage 'https://github.com/wg/wrk'
  url 'https://github.com/wg/wrk/archive/3.1.0.tar.gz'
  sha1 '3ddc1e591a846b92899a534abf4bc49d2c6cd98e'
  head 'https://github.com/wg/wrk.git'

  bottle do
    cellar :any
    sha1 "fc53ca6e999d01e92f6046a01aab603131b83f80" => :mavericks
    sha1 "0d0f982a8f065c57eada5aececa02d59e30ca7d2" => :mountain_lion
    sha1 "083fba8b6773f4c8f0aed6b52d8f84321edd8fc4" => :lion
  end

  depends_on 'openssl'

  conflicts_with 'wrk-trello', :because => 'both install `wrk` binaries'

  def install
    ENV.j1
    system "make"
    bin.install "wrk"
  end

  test do
    system *%W{#{bin}/wrk -c 1 -t 1 https://github.com/}
  end
end
