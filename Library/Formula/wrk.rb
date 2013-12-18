require 'formula'

class Wrk < Formula
  homepage 'https://github.com/wg/wrk'
  url 'https://github.com/wg/wrk/archive/3.0.4.tar.gz'
  sha1 '55ac8311878f81a6cc9d649da930792e2efb6fe7'
  head 'https://github.com/wg/wrk.git'

  bottle do
    cellar :any
    sha1 '7c7df579367da60889d0a41106235fc21bfcebe0' => :mavericks
    sha1 '4afb3837ae0678c0eaa9076d12ee420bceb43ae0' => :mountain_lion
    sha1 'da71afc0ccc5699f7d65d019ad7e5899cf6e2e2d' => :lion
  end

  conflicts_with 'wrk-trello', :because => 'both install `wrk` binaries'

  def install
    ENV.j1
    system "make"
    bin.install "wrk"
  end

  test do
    system *%W{#{bin}/wrk -c 1 -t 1 http://www.github.com/}
  end
end
