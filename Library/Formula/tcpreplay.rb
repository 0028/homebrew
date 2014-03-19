require 'formula'

class Tcpreplay < Formula
  homepage 'http://tcpreplay.synfin.net'
  url 'https://downloads.sourceforge.net/project/tcpreplay/tcpreplay/4.0.3/tcpreplay-4.0.3.tar.gz'
  sha1 '1410ddf0cd239ef825380cc8d1f495df39106404'

  bottle do
    cellar :any
    sha1 "10207d1399fa246ecaa8b6d03c8e2276c1b61cad" => :mavericks
    sha1 "d34f3f45041579b0eb30d04b5ff690ab1c0dabf7" => :mountain_lion
    sha1 "debcb7552b242ab3c7fc498c537d77f31972640d" => :lion
  end

  # Hard-code use of dylib instead of so
  patch :DATA

  def install
    inreplace "src/common/Makefile.in" do |s|
      s.gsub! "libcommon_a_LIBADD = ../../lib/libstrl.a", ""
      s.gsub! "libcommon_a_DEPENDENCIES = ../../lib/libstrl.a", ""
    end

    system "./configure", "--disable-dependency-tracking", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--enable-dynamic-link"
    system "make install"
  end
end

__END__
diff --git a/configure b/configure
index d41d433..9514748 100755
--- a/configure
+++ b/configure
@@ -9872,7 +9872,7 @@ darwin* | rhapsody*)
   soname_spec='${libname}${release}${major}$shared_ext'
   shlibpath_overrides_runpath=yes
   shlibpath_var=DYLD_LIBRARY_PATH
-  shrext_cmds='`test .$module = .yes && echo .so || echo .dylib`'
+  shrext_cmds=".dylib"
 
   sys_lib_search_path_spec="$sys_lib_search_path_spec /usr/local/lib"
   sys_lib_dlsearch_path_spec='/usr/local/lib /lib /usr/lib'
@@ -14675,7 +14675,7 @@ darwin* | rhapsody*)
   soname_spec='${libname}${release}${major}$shared_ext'
   shlibpath_overrides_runpath=yes
   shlibpath_var=DYLD_LIBRARY_PATH
-  shrext_cmds='`test .$module = .yes && echo .so || echo .dylib`'
+  shrext_cmds=".dylib"
 
   sys_lib_dlsearch_path_spec='/usr/local/lib /lib /usr/lib'
   ;;
