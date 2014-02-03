require 'formula'

class Pocl < Formula
  homepage 'http://pocl.sourceforge.net'
  url 'http://pocl.sourceforge.net/downloads/pocl-0.9.tar.gz'
  sha1 'd6e30f3120c7952dec9004db1db91a11d08c7b74'

  bottle do
    sha1 "8b72b7a1fb6936bfb9643f2672992353b6942c73" => :mavericks
    sha1 "bf31d18adc1b02fcd226e325172bfa2b4b2e73f5" => :mountain_lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'hwloc'
  depends_on 'llvm' => 'with-clang'
  depends_on :libltdl

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
    system "\"#{Formula.factory('llvm').opt_prefix}/bin/llvm-dis\" < foo.bc | grep foo_workgroup"
    system "pkg-config pocl --modversion | grep #{version}"
  end
end
