require "formula"

class Rssh < Formula
  homepage "http://www.pizzashack.org/rssh"
  url "https://downloads.sourceforge.net/project/rssh/rssh/2.3.4/rssh-2.3.4.tar.gz"
  sha1 "e13ae1fdce4b0c89ef70f4695689139c8409e2e8"

  bottle do
    sha1 "8006fc81d06785ae499d91f10b81e0ece4ba7a0d" => :mavericks
    sha1 "bfe453486254b8e2e7ca166ee12e8571eb168653" => :mountain_lion
    sha1 "6262ba1168f7b3c16ccfc4d0c2c7db5d587fa95b" => :lion
  end

  def patches
    "https://gist.githubusercontent.com/arminsch/9230011/raw/f0c5ed95bbba0be28ce2b5f0d1080de84ec317ab/rsshconf-log-rename.diff"
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make"
    system "make", "install"
  end

  test do
    # test to check if everything is linked correctly
    system "#{bin}/rssh", "-v"
    # the following test checks if rssh, if invoked without commands and options, fails
    system "sh", "-c", "! #{bin}/rssh"
  end
end
