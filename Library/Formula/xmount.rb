require "formula"

class Xmount < Formula
  homepage "https://www.pinguin.lu/index.php"
  url "http://files.pinguin.lu/projects/xmount-0.5.0.tar.gz"
  sha1 "3a0b208db38f987ce97458bbae8db20e1f3cdba9"

  bottle do
    cellar :any
    sha1 "5ad6a780cb31292966c5771156eda2a25f0c7a59" => :mavericks
    sha1 "3b4ac8cb6bc7ba6d61274b4a60be469255b34f5f" => :mountain_lion
    sha1 "7cd439313fbdda0fc189d0fe7b26c3f37dc6313f" => :lion
  end

  depends_on "pkg-config" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "osxfuse"
  depends_on "libewf"

  def patches
    DATA
  end

  def install
    system "aclocal -I #{HOMEBREW_PREFIX}/share/aclocal"
    system "autoconf"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

__END__
diff  a/configure.ac b/configure.ac
--- a/configure.ac
+++ b/configure.ac
@@ -2,9 +2,9 @@

 AC_PREREQ(2.61)
 AC_INIT([xmount], [0.5.0], [bugs@pinguin.lu])
-AM_INIT_AUTOMAKE(@PACKAGE_NAME@, @PACKAGE_VERSION@)
 AC_CONFIG_SRCDIR([xmount.c])
 AC_CONFIG_HEADER([config.h])
+AM_INIT_AUTOMAKE

 # Checks for programs.
 AC_PROG_CC
