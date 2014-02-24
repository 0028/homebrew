require "formula"

class DockerOsx < Formula
  homepage "https://github.com/noplay/docker-osx"
  url "https://github.com/noplay/docker-osx/archive/0.7.6.tar.gz"
  sha1 "86f082da0a328742cf15683d53860d322822c6a7"

  bottle do
    cellar :any
    sha1 "79f92d0d29e86eb8f257f2da1fc8e3cbde7dd99e" => :mavericks
    sha1 "6fafbbe0691557edee1d51492092e9bb5162fdb2" => :mountain_lion
    sha1 "b32eceba4a5036319f9906bf30e9e60a5512097b" => :lion
  end

  depends_on "docker"

  def install
    bin.install "docker-osx"
  end
end
