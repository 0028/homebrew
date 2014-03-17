require "formula"

class Fsw < Formula
  homepage "http://emcrisostomo.github.io/fsw/"
  url "https://github.com/emcrisostomo/fsw/releases/download/v1.3.0/fsw-1.3.0.tar.gz"
  sha1 "9350fc405ca62af5ad00edf1d59ce881018abcb5"

  bottle do
    cellar :any
    sha1 "aa41295cbbc54c4c754e1bd5d87f98996e2b985e" => :mavericks
    sha1 "9f1b8c76b5ec6ff553625a65599611417156a49a" => :mountain_lion
    sha1 "e71cecb3cfbb0ff6bbadc3102704415f1db00bf1" => :lion
  end

  def install
    ENV.append 'CXXFLAGS', '-stdlib=libc++'
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    io = IO.popen("fsw test")
    (testpath/'test').write('foo')
    assert_equal File.expand_path("test"), io.gets.strip
    Process.kill "INT", io.pid
    Process.wait io.pid
  end
end
