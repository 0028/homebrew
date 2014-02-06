require 'formula'

class Freeipmi < Formula
  homepage 'http://www.gnu.org/software/freeipmi/'
  url 'http://ftpmirror.gnu.org/freeipmi/freeipmi-1.3.4.tar.gz'
  sha1 '3848b5b014d60cf9ff8b848b65f192bb15ad0816'

  bottle do
    sha1 "a7680b49df91dea7c33970e7dda07a908dd0cfb4" => :mavericks
    sha1 "c0f078a337cff5a059520dae79a733e68ba0d315" => :mountain_lion
    sha1 "cdac8088ea4b2f5db939342725d5012162c7e7ef" => :lion
  end

  depends_on "argp-standalone" => :build
  depends_on 'libgcrypt'       => :build

  #Patches can be removed when freeipmi 1.4.1 is released in Feb/March 2014
  def patches
    DATA
  end

  def install
    system './configure', "--prefix=#{prefix}"
    # This is a big hammer to disable building the man pages
    # It breaks under homebrew's build system and I'm not sure why
    system 'sed', '-i', "''", 's/install: install-am/install:/', './man/Makefile'
    system 'make', 'install'
  end

  test do
    system "#{sbin}/ipmi-fru", "--version"
  end

end

__END__
diff -u -r freeipmi-1.3.4.orig/common/toolcommon/tool-daemon-common.h freeipmi-1.3.4/common/toolcommon/tool-daemon-common.h
--- freeipmi-1.3.4.orig/common/toolcommon/tool-daemon-common.h  2013-04-26 10:01:55.000000000 -0700
+++ freeipmi-1.3.4/common/toolcommon/tool-daemon-common.h 2014-02-05 15:54:20.000000000 -0800
@@ -24,6 +24,7 @@

 int daemonize_common (const char *pidfile);

+typedef void (*sighandler_t)(int);
 /* can pass NULL for no callback */
 int daemon_signal_handler_setup (sighandler_t cb);

diff -u -r freeipmi-1.3.4.orig/libfreeipmi/driver/ipmi-semaphores.h freeipmi-1.3.4/libfreeipmi/driver/ipmi-semaphores.h
--- freeipmi-1.3.4.orig/libfreeipmi/driver/ipmi-semaphores.h  2013-04-26 10:01:55.000000000 -0700
+++ freeipmi-1.3.4/libfreeipmi/driver/ipmi-semaphores.h 2014-02-05 15:55:02.000000000 -0800
@@ -30,7 +30,7 @@
 #include <sys/ipc.h>
 #include <sys/sem.h>

-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__APPLE__)
 /* union semun is defined by including <sys/sem.h> */
 #else
 /* according to X/OPEN we have to define it ourselves */
