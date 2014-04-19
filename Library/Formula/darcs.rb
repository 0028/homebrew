require "formula"
require "language/haskell"

class Darcs < Formula
  include Language::Haskell::Cabal

  homepage "http://darcs.net/"
  url "http://darcs.net/releases/darcs-2.8.4.tar.gz"
  sha1 "36dde7548a9d73f4688296cac72bcda672542e53"

  bottle do
    cellar :any
    sha1 "557d5fc7b5cb8c70a9ab205c0379dfb1e4cf3902" => :mavericks
    sha1 "9387cbf5abf286b3ba3f2c4ebf4c7b60d1b98c66" => :mountain_lion
    sha1 "b52a2eda94a5c59c68f1f0248c3e90c7c9df909e" => :lion
  end

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    cabal_install_package
  end

  test do
    mkdir "my_repo" do
      system "darcs", "init"
      (Pathname.pwd/"foo").write "hello homebrew!"
      system "darcs", "add", "foo"
      system "darcs", "record", "-am", "add foo", "--author=homebrew"
    end
    system "darcs", "get", "my_repo", "my_repo_clone"
    Dir.chdir "my_repo_clone" do
      assert (Pathname.pwd/"foo").read.include?  "hello homebrew!"
    end
  end
end
