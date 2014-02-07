require 'formula'

class Cc65 < Formula
  homepage 'http://www.cc65.org/'
  head 'svn://svn.cc65.org/cc65/trunk'
  url 'ftp://ftp.musoftware.de/pub/uz/cc65/cc65-sources-2.13.3.tar.bz2'
  sha1 '925c6edfcef7057e24ecb0704fa07210faec07bc'

  bottle do
    sha1 "f75dfe5805bf2ddfdae3d2edba8722f8586e09c3" => :mavericks
    sha1 "0d8f6e4f8e845b36b4f2aaa123dc96a9729b631c" => :mountain_lion
    sha1 "b95045ce73a1fb9c99de97330a170d3275e59923" => :lion
  end

  conflicts_with 'grc', :because => 'both install `grc` binaries'

  def install
    ENV.deparallelize
    ENV.no_optimization
    system "make", "-f", "make/gcc.mak", "prefix=#{prefix}", "libdir=#{share}"
    system "make", "-f", "make/gcc.mak", "install", "prefix=#{prefix}", "libdir=#{share}"
  end

  def caveats; <<-EOS.undent
    Library files have been installed to:
      #{share}/cc65
    EOS
  end

  test do
    (testpath/"foo.c").write "int main (void) { return 0; }"

    system bin/"cl65", "foo.c" # compile and link
    assert File.exist?("foo")  # binary
  end
end
