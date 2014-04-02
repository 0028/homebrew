require "formula"

class GitMap < Formula
  homepage "https://github.com/clarkema/git-map"
  url "https://github.com/clarkema/git-map/archive/v0.0.3.tar.gz"
  sha1 "eea43a160d2cf68d30fc421da8b8ae96dccdd89e"

  bottle do
    cellar :any
    sha1 "27b0ac2debc02616ced7c31f2ecbb4f151648d3c" => :mavericks
    sha1 "f162676c631eacd4ddee6c8c3163326b4fe1a15e" => :mountain_lion
    sha1 "565e49562203c170f1a91889fe125d4bb3f46abe" => :lion
  end

  def install
    system "pod2man ./bin/git-map > git-map.1"
    bin.install "bin/git-map"
    man1.install "git-map.1"
  end

  test do
    system "git-map"
  end
end
