require 'formula'

class Capstone < Formula
  homepage 'http://capstone-engine.org'
  url 'http://capstone-engine.org/download/2.1/capstone-2.1.tgz'
  sha1 '3e5fe91684cfc76d73caa857a268332ac9d40659'

  bottle do
    cellar :any
    sha1 "36a9b4fd45beb7e9c87a9dbfa2dcca0a3b2bab68" => :mavericks
    sha1 "44bb036c50cf586e477f1fc68415e972f2e28380" => :mountain_lion
    sha1 "b2071f74797a90fc112c9afc886c9492f06c0e47" => :lion
  end

  def patches
    # fix pkgconfig path
    DATA
  end

  def install
    # Fixed upstream in next version:
    # https://github.com/aquynh/capstone/commit/dc0d04522fa6ca7222124f390f51eb9e106906f7.diff
    inreplace 'Makefile', 'lib64', 'lib'
    system "./make.sh"
    ENV["PREFIX"] = prefix
    system "./make.sh", "install"
  end
end


__END__
--- a/Makefile.org	2014-03-05 11:26:42.000000000 +0800
+++ a/Makefile	2014-03-05 11:28:34.000000000 +0800
@@ -144,13 +144,6 @@
 ifeq ($(UNAME_S),Darwin)
 EXT = dylib
 AR_EXT = a
-# By default, suppose that Brew is installed & use Brew path for pkgconfig file
-PKGCFCGDIR = /usr/local/lib/pkgconfig
-# is Macport installed instead?
-ifneq (,$(wildcard /opt/local/bin/port))
-# then correct the path for pkgconfig file
-PKGCFCGDIR = /opt/local/lib/pkgconfig
-endif
 else
 # Cygwin?
 IS_CYGWIN := $(shell $(CC) -dumpmachine | grep -i cygwin | wc -l)
