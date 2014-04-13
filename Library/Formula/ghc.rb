require 'formula'

class Ghc < Formula
  homepage "http://haskell.org/ghc/"
  url "https://www.haskell.org/ghc/dist/7.8.2/ghc-7.8.2-src.tar.xz"
  sha1 "fe86ae790b7e8e5b4c78db7a914ee375bc6d9fc3"

  bottle do
    sha1 "0b05bfe99f10d8668271317b60b55be9ed5a5f46" => :mavericks
    sha1 "cacd2c6dca4f29ab183c81a024e5b29735f80536" => :mountain_lion
  end

  option "tests", "Verify the build using the testsuite."

  env :std
  depends_on :macos => :mountain_lion

  resource "binary" do
    url "https://www.haskell.org/ghc/dist/7.8.2/ghc-7.8.2-x86_64-apple-darwin-mavericks.tar.xz"
    sha1 "5219737fb38f882532712047f6af32fc73a91f0f"
  end

  resource "testsuite" do
    url "https://www.haskell.org/ghc/dist/7.8.2/ghc-7.8.2-testsuite.tar.xz"
    sha1 "3abe4e0ebbed17e825573f0f34be0eca9179f9e4"
  end

  def install
    # Move the main tarball contents into a subdirectory
    (buildpath+"Ghcsource").install Dir["*"]

    resource("binary").stage do
      # Define where the subformula will temporarily install itself
      subprefix = buildpath+"subfo"

      args = ["--prefix=#{subprefix}"]
      system "./configure", *args
      # -j1 fixes an intermittent race condition
      system "make", "-j1", "install"
      ENV.prepend_path "PATH", subprefix/"bin"
    end

    cd "Ghcsource" do
      args = ["--prefix=#{prefix}"]
      system "./configure", *args
      system "make"

      if build.include? "tests"
        resource("testsuite").stage do
          cd "testsuite" do
            (buildpath+"Ghcsource/config").install Dir["config/*"]
            (buildpath+"Ghcsource/driver").install Dir["driver/*"]
            (buildpath+"Ghcsource/mk").install Dir["mk/*"]
            (buildpath+"Ghcsource/tests").install Dir["tests/*"]
            (buildpath+"Ghcsource/timeout").install Dir["timeout/*"]
          end
          cd (buildpath+"Ghcsource/tests") do
            system "make", "CLEANUP=1", "THREADS=#{ENV.make_jobs}", "fast"
          end
        end
      end

      system "make"
      # -j1 fixes an intermittent race condition
      system "make", "-j1", "install"
    end
  end

  def caveats; <<-EOS.undent
    This brew is for GHC only; you might also be interested in haskell-platform.
    EOS
  end

  test do
    hello = (testpath/"hello.hs")
    hello.write('main = putStrLn "Hello Homebrew"')
    output = `echo "main" | '#{bin}/ghci' #{hello}`
    assert $?.success?
    assert_match /Hello Homebrew/i, output
  end
end
