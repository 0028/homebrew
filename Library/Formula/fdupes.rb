require 'formula'

class Fdupes < Formula
  homepage 'http://code.google.com/p/fdupes/'
  url 'http://fdupes.googlecode.com/files/fdupes-1.51.tar.gz'
  sha1 '8276b39026f57a2f9503d7af18efca0a7d42b8ec'

  bottle do
    cellar :any
    sha1 "cff74e27812d6e9e0f9f0fc2576e94572791942b" => :mavericks
    sha1 "9c4aaeec6b92fe67aaebe98d9ec5041ea0862ae8" => :mountain_lion
    sha1 "54c47cba85c5617deba26c8ded8864bc6ddb8213" => :lion
  end

  def install
    inreplace "Makefile", "gcc", "#{ENV.cc} #{ENV.cflags}"
    system "make fdupes"
    bin.install "fdupes"
    man1.install "fdupes.1"
  end

  test do
    touch "a"
    touch "b"

    dupes = `#{bin}/fdupes .`.strip.split("\n").sort
    assert_equal ["./a", "./b"], dupes
    assert_equal 0, $?.exitstatus
  end
end
