require 'formula'

class ObjectiveCaml < Formula
  homepage 'http://ocaml.org'
  url 'http://caml.inria.fr/pub/distrib/ocaml-4.01/ocaml-4.01.0.tar.gz'
  sha1 '31ae98051d42e038f4fbc5fd338c4fa5c36744e0'

  head 'http://caml.inria.fr/svn/ocaml/trunk', :using => :svn

  depends_on :x11 if MacOS::X11.installed?

  bottle do
    revision 3
    sha1 "69709c4d6f3909c98cc181a208c626324ea2f2cb" => :mavericks
    sha1 "f4418d8447a8a1d105598d5889ebaa6a04a7aa60" => :mountain_lion
    sha1 "3fb0e59782c69bcdea69f2e84c677c3b4eb38f11" => :lion
  end

  # recent versions of clang fail with a hard error if -fno-defer-pop
  # is specified, and older versions warn.  This patch fixes the OCaml
  # configure script to not pass this option on recent MacOS versions.
  # See http://caml.inria.fr/mantis/view.php?id=6346 for upstream bug.
  def patches
    DATA
  end

  def install
    system "./configure", "--prefix", HOMEBREW_PREFIX,
                          "--mandir", man,
                          "-cc", ENV.cc,
                          "-with-debug-runtime",
                          "-aspp", "#{ENV.cc} -c"
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make world"
    system "make opt"
    system "make opt.opt"
    system "make", "PREFIX=#{prefix}", "install"

    # site-lib in the Cellar will be a symlink to the HOMEBREW_PREFIX location,
    # which is mkpath'd by Keg#link when something installs into it
    ln_s HOMEBREW_PREFIX/"lib/ocaml/site-lib", lib/"ocaml/site-lib"
  end
end
__END__
diff --git a/configure b/configure
index d45e88f..25d872b 100755
--- a/configure
+++ b/configure
@@ -322,7 +322,14 @@ case "$bytecc,$target" in
     bytecccompopts="-fno-defer-pop $gcc_warnings -DSHRINKED_GNUC"
     mathlib="";;
   *,*-*-darwin*)
-    bytecccompopts="-fno-defer-pop $gcc_warnings"
+    # On recent version of OSX, gcc is a symlink to clang
+    if $bytecc --version | grep -q clang; then
+        # -fno-defer-pop is not supported by clang, and make recent
+        # versions of clang to fail
+        bytecccompopts="$gcc_warnings"
+    else
+        bytecccompopts="-fno-defer-pop $gcc_warnings"
+    fi
     mathlib=""
     mkexe="$mkexe -Wl,-no_compact_unwind"
     # Tell gcc that we can use 32-bit code addresses for threaded code
