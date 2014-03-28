require "formula"
require "language/haskell"

class GitAnnex < Formula
  include Language::Haskell::Cabal

  homepage "https://git-annex.branchable.com/"
  url "http://hackage.haskell.org/package/git-annex-5.20140402/git-annex-5.20140402.tar.gz"
  sha1 "5814fc1cdc2a6c2ba89525ead0969e47bf999c37"

  depends_on "apple-gcc42" => :build
  depends_on "ghc" => :build
  depends_on "cabal-install" => :build
  depends_on "pkg-config" => :build
  depends_on "gnutls"
  depends_on "gsasl"
  depends_on "libidn"

  # fix missing shakespeare dependency - see https://github.com/joeyh/git-annex/pull/22
  patch :DATA

  def install
    cabal_sandbox do
      ["alex", "happy", "c2hs"].each {|t| cabal_install t}
      # gcc required to build gnuidn
      cabal_install "--with-gcc=#{Formula["apple-gcc42"].bin}/gcc-4.2", "--only-dependencies"
      cabal_install "--prefix=#{prefix}"
    end
  end

  test do
    # make sure git can find git-annex
    ENV.prepend_path 'PATH', bin
    # create a first git repository with an annex
    mkdir "my_annex" do
      system "git", "init"
      system "git", "annex", "init", "my_annex"
      cp bin/"git-annex", "bigfile"
      system "git", "annex", "add", "bigfile"
      system "git", "commit", "-am", "big file added"
      assert File.symlink? "bigfile"
    end
    # and propagate its content to another
    system "git", "clone", "my_annex", "my_annex_clone"
    Dir.chdir "my_annex_clone" do
      assert (not File.file? "bigfile")
      system "git", "annex", "get", "bigfile"
      assert File.file? "bigfile"
    end
    # make test files writable so homebrew can drop them
    chmod_R 0777, testpath
  end
end

__END__
--- a/git-annex.cabal	2014-04-05 14:10:06.000000000 +0200
+++ b/git-annex.cabal	2014-04-05 15:27:14.000000000 +0200
@@ -101,7 +101,7 @@
    base (>= 4.5 && < 4.9), monad-control, MonadCatchIO-transformers,
    IfElse, text, QuickCheck >= 2.1, bloomfilter, edit-distance, process,
    SafeSemaphore, uuid, random, dlist, unix-compat, async, stm (>= 2.3),
-   data-default, case-insensitive
+   data-default, case-insensitive, shakespeare
   CC-Options: -Wall
   GHC-Options: -Wall
   Extensions: PackageImports
