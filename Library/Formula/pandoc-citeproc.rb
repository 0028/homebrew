require "formula"
require "language/haskell"

class PandocCiteproc < Formula
  include Language::Haskell::Cabal

  homepage "https://github.com/jgm/pandoc-citeproc"
  url "http://hackage.haskell.org/package/pandoc-citeproc-0.3.0.1/pandoc-citeproc-0.3.0.1.tar.gz"
  sha1 "958309f9996d563ffba0bd4870bb7f201aac08e8"

  bottle do
    sha1 "fc0e5575030a8f01d56354359200d0126e0f6e99" => :mavericks
    sha1 "d72bc35593648a2893f9ada11cfbd1665044e09d" => :mountain_lion
    sha1 "6e7e9af8847458f347c0a51b87901816c09ae203" => :lion
  end

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    cabal_sandbox do
      ["alex", "happy"].each {|t| cabal_install t}
      cabal_install "--only-dependencies"
      cabal_install "--prefix=#{prefix}"
    end
    cabal_clean_lib
  end

  test do
    bib = testpath/"test.bib"
    bib.write <<-EOS.undent
      @Book{item1,
      author="John Doe",
      title="First Book",
      year="2005",
      address="Cambridge",
      publisher="Cambridge University Press"
      }
    EOS
    assert `pandoc-citeproc --bib2yaml #{bib}`.include? "- publisher-place: Cambridge"
  end
end
