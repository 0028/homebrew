require 'formula'

class HaskellPlatform < Formula
  homepage 'http://hackage.haskell.org/platform/'
  url 'http://lambda.haskell.org/platform/download/2013.2.0.0/haskell-platform-2013.2.0.0.tar.gz'
  sha1 '8669bb5add1826c0523fb130c095fb8bf23a30ce'

  bottle do
    sha1 '21454cc3213271224207da3c255ebb60725c8dd6' => :mavericks
    sha1 '45261b3aa2721ace8e72b9594e76f6e0e157bc55' => :mountain_lion
    sha1 'b40120f03cd1825b048725cd7d9a9e3facf8969e' => :lion
  end

  depends_on 'ghc'

  conflicts_with 'cabal-install'

  def install
    # libdir doesn't work if passed to configure, needs to be set in the environment
    system "./configure", "--prefix=#{prefix}"
    ENV['EXTRA_CONFIGURE_OPTS'] = "--libdir=#{lib}/ghc"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Add cabal binaries to your PATH:
      export PATH=~/.cabal/bin:$PATH

    Run `cabal update` to initialize the package list.

    If you are replacing a previous version of haskell-platform, you may want
    to unregister packages belonging to the old version. You can find broken
    packages using:
      ghc-pkg check --simple-output
    You can uninstall them using:
      ghc-pkg check --simple-output | xargs -n 1 ghc-pkg unregister --force
    EOS
  end
end
