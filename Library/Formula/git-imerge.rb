require "formula"

class GitImerge < Formula
  homepage "https://github.com/mhagger/git-imerge"
  url "https://github.com/mhagger/git-imerge/archive/0.7.0.tar.gz"
  sha1 "b3bab94743a79426ea79c1b5e503020ef7fbf2ec"

  bottle do
    cellar :any
    sha1 "45a02912894c19eb87a3429c049fb0e0fc131cea" => :mavericks
    sha1 "58f2fac073de49465860cf8d6920bdb1b0434af3" => :mountain_lion
    sha1 "3c768831458407f7d9a14dcb8d87b97a080d378e" => :lion
  end

  def install
    bin.install "git-imerge"
  end

  test do
    system "git-imerge -h"
  end
end
