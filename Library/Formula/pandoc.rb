require "formula"
require "language/haskell"

class Pandoc < Formula
  include Language::Haskell::Cabal

  homepage "http://johnmacfarlane.net/pandoc/"
  url "https://pandoc.googlecode.com/files/pandoc-1.12.3.tar.gz"
  sha1 "f519b5fb8c88ff4374432477dc12f68bbe238510"

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
