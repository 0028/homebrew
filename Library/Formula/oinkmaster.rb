require 'formula'

class Oinkmaster < Formula
  homepage 'http://oinkmaster.sourceforge.net/'
  url 'http://switch.dl.sourceforge.net/project/oinkmaster/oinkmaster/2.0/oinkmaster-2.0.tar.gz'
  sha1 '01a0d774195670a11af5ff3e302773d962b34224'

  bottle do
    cellar :any
    sha1 'cf68a67ff25cff2096c091e78ac1d7a43e277f73' => :mavericks
    sha1 'd69a84d73c8ad1e98cfe6bf9640b077309fbca63' => :mountain_lion
    sha1 'bdb8ffd7adf6b32dca2afec6c150d049f3ab81ff' => :lion
  end

  depends_on 'wget'

  def patches
    # add url for rules, patch for search config and fix installing
    DATA
  end

  def install
    system "make","DESTDIR=#{prefix}","install"
  end
end
__END__
diff -Nru oinkmaster-2.0.orig/Makefile oinkmaster-2.0/Makefile
--- oinkmaster-2.0.orig/Makefile	1970-01-01 03:00:00.000000000 +0300
+++ oinkmaster-2.0/Makefile	2013-09-28 17:17:08.000000000 +0300
@@ -0,0 +1,11 @@
+.PHONY: install
+INSTALL_DIR = /usr/bin/install -d -m 755 
+INSTALL_PROGRAM = /usr/bin/install -m 555 
+INSTALL_DATA = /usr/bin/install -m 644
+install:
+	$(INSTALL_DIR) "$(DESTDIR)/etc"
+	$(INSTALL_DATA) oinkmaster.conf "$(DESTDIR)/etc"
+	$(INSTALL_DIR) "$(DESTDIR)/man1"
+	$(INSTALL_DATA) oinkmaster.1 "$(DESTDIR)/man1"
+	$(INSTALL_DIR) "$(DESTDIR)/bin"
+	$(INSTALL_PROGRAM) oinkmaster.pl "$(DESTDIR)/bin"
diff -Nru oinkmaster-2.0.orig/oinkmaster.conf oinkmaster-2.0/oinkmaster.conf
--- oinkmaster-2.0.orig/oinkmaster.conf	2006-02-18 14:35:21.000000000 +0200
+++ oinkmaster-2.0/oinkmaster.conf	2013-09-27 14:04:20.000000000 +0300
@@ -79,6 +79,8 @@
 # OpenSSH manual. 
 # scp_key = /home/oinkmaster/oinkmaster_privkey
 
+# Emerging threats rules for suricata
+url = http://rules.emergingthreats.net/open/suricata/emerging.rules.tar.gz
 
 # The PATH to use during execution. If you prefer to use external 
 # binaries (i.e. use_external_bins=1, see below), tar and gzip must be 
diff -Nru oinkmaster-2.0.orig/oinkmaster.pl oinkmaster-2.0/oinkmaster.pl
--- oinkmaster-2.0.orig/oinkmaster.pl	2006-02-18 14:35:21.000000000 +0200
+++ oinkmaster-2.0/oinkmaster.pl	2013-09-27 14:08:40.000000000 +0300
@@ -134,6 +134,7 @@
 my @DEFAULT_CONFIG_FILES = qw(
     /etc/oinkmaster.conf
     /usr/local/etc/oinkmaster.conf
+    HOMEBREW_PREFIX/etc/oinkmaster.conf
 );
 
 my @DEFAULT_DIST_VAR_FILES = qw(
