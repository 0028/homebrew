require 'formula'

class Stormfs < Formula
  homepage 'https://github.com/benlemasurier/stormfs'
  url 'https://github.com/downloads/benlemasurier/stormfs/stormfs-0.01.tar.gz'
  sha1 'd86bb74beb4b4343b63b3eda3e6bd6f4db982bbb'

  bottle do
    sha1 "b20a2ad5e120044878a87bd03905dbf5cde072d4" => :mavericks
    sha1 "ef1925676d1af027fb01fe7bdd8b70785db2248c" => :mountain_lion
    sha1 "0796267dd606040bd7532c9abe2a71b5be9e8a5f" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'fuse4x'
  depends_on 'curl' if MacOS.version <= :leopard

  def patches; DATA; end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end

__END__
diff --git a/src/curl.c b/src/curl.c
index de43059..0b02053 100644
--- a/src/curl.c
+++ b/src/curl.c
@@ -23,7 +23,6 @@
 #include <sys/stat.h>
 #include <unistd.h>
 #include <curl/curl.h>
-#include <curl/types.h>
 #include <curl/easy.h>
 #include <pthread.h>
 #include <glib.h>
