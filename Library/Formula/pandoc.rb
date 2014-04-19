require "formula"
require "language/haskell"

class Pandoc < Formula
  include Language::Haskell::Cabal

  homepage "http://johnmacfarlane.net/pandoc/"
  url "https://pandoc.googlecode.com/files/pandoc-1.12.3.tar.gz"
  sha1 "f519b5fb8c88ff4374432477dc12f68bbe238510"

  bottle do
    sha1 "7ad7517fb5ac7ed3e950af7b3a4f9af7b1c417a4" => :mavericks
    sha1 "9e2eb4fa8344c1619771940d0cd12e42338f5aa7" => :mountain_lion
    sha1 "2cbf5718ac852755d05d0c6611f0a2c737a634b0" => :lion
  end

  resource "completion" do
    url "https://github.com/dsanson/pandoc-completion.git", :branch => "master"
  end

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    resource("completion").stage do
      bash_completion.install "pandoc-completion.bash"
    end
    cabal_sandbox do
      ["alex", "happy"].each {|t| cabal_install t}
      cabal_install "--only-dependencies"
      cabal_install "--prefix=#{prefix}"
    end
    cabal_clean_lib
  end

  test do
    system "pandoc", "-o", "output.html", prefix/"README"
    assert (Pathname.pwd/"output.html").read.include? '<h1 id="synopsis">Synopsis</h1>'
  end
end
