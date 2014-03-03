require 'formula'

class Pocl < Formula
  homepage 'http://pocl.sourceforge.net'
  url 'http://pocl.sourceforge.net/downloads/pocl-0.9.tar.gz'
  sha1 'd6e30f3120c7952dec9004db1db91a11d08c7b74'

  bottle do
    sha1 "b820bb80ec1b69ec6cdb1b1cf84365a9eb38346f" => :mavericks
    sha1 "954bb433314fa5ecca69ae3b12c947c23120d6e2" => :mountain_lion
    sha1 "18277345c823f12bfeb4b61be7fbf67630b5b59d" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'hwloc'
  depends_on 'llvm' => 'with-clang'
  depends_on :libltdl

  def patches
    # Check if ndebug flag is required for compiling pocl didn't work on osx
    # for some reason. Information if bug is fixed is found from
    # https://github.com/pocl/pocl/issues/59
    DATA
  end

  def install
    ENV.j1
    system "./configure", "--disable-debug",
                          "--enable-direct-linkage",
                          "--disable-icd",
                          "--enable-testsuites=",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/'foo.cl').write <<-EOS.undent
      kernel void foo(int *in, int *out) {
        int i = get_global_id(0);
        out[i] = in[i];
      }
    EOS
    system "#{bin}/pocl-standalone -h head.h -o foo.bc foo.cl"
    system "\"#{Formula["llvm"].opt_prefix}/bin/llvm-dis\" < foo.bc | grep foo_workgroup"
    system "pkg-config pocl --modversion | grep #{version}"
  end
end

__END__
diff --git a/configure b/configure
index 01d3e24..55bf55c 100755
--- a/configure
+++ b/configure
@@ -18375,6 +18375,11 @@ else
   LLVM_HAS_ASSERTIONS_FALSE=
 fi
 
+# Hardcoded information that llvm compiled by homebrew has asserts
+# for some reason test above did not give correct result
+# https://github.com/pocl/pocl/issues/59
+LLVM_HAS_ASSERTIONS_TRUE=
+LLVM_HAS_ASSERTIONS_FALSE='#'
 
 fi
 rm -f core conftest.err conftest.$ac_objext \
