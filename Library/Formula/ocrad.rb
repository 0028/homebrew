require 'formula'

class Ocrad < Formula
  homepage 'http://www.gnu.org/software/ocrad/'
  url 'http://ftpmirror.gnu.org/ocrad/ocrad-0.22.tar.lz'
  bottle do
    cellar :any
    sha1 'b3f2e3e1aa613aac016c3dfd129661c5d20051ec' => :mavericks
    sha1 'f85234cff1fc207cbec30ff924279dbbeafa0216' => :mountain_lion
    sha1 '5a38e19e3f0eaeae56e5e0e3461945dc2e465b56' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/ocrad/ocrad-0.22.tar.lz'
  sha1 'cfb3284b9d7387af80bcd795c093624eb40f6d13'

  def patches
    # Patch to compile with libc++ in Mavericks. Reported to list:
    # http://lists.gnu.org/archive/html/bug-ocrad/2013-11/msg00000.html
    "https://gist.github.com/mcs07/7751030/raw/4f43e7cd123c33fbcc2459fa496b3ee8ecf344a0/ocrad-mavericks.diff"
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install", "CXXFLAGS=#{ENV.cxxflags}"
  end

  test do
    system "#{bin}/ocrad", "-h"
  end
end
