require 'formula'

class Scrub < Formula
  homepage 'http://code.google.com/p/diskscrub/'
  url 'https://diskscrub.googlecode.com/files/scrub-2.5.2.tar.bz2'
  sha1 '863e5894e6acb3f922cb25f58e260f9c59b55c14'

  bottle do
    cellar :any
    sha1 "c18f2713940d3bc3594265445e388cec3f511efa" => :mavericks
    sha1 "191bf37032d7c9e442c79a65be6738d2d4f0a426" => :mountain_lion
    sha1 "c39092e0ea1b24c336d04fba3878f3d564e31dc3" => :lion
  end

  # in src/genrand.c:109 the `return;` statement should be `return 0;` for clang
  # in src/util.h we need <sys/types.h> to get off_t which is reported:
  # https://code.google.com/p/diskscrub/issues/detail?id=21
  def patches; DATA; end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    path = testpath/"foo.txt"
    path.write "foo"

    output = `#{bin}/scrub -r -p dod #{path}`
    assert output.include?("scrubbing #{path}")
    assert_equal 0, $?.exitstatus
    assert !File.exist?(path)
  end
end

__END__
--- a/src/genrand.c	2012-06-20 15:00:27.000000000 -0700
+++ b/src/genrand.c	2012-10-27 22:02:27.000000000 -0700
@@ -106,7 +106,7 @@
                 buf[n] = result;
             }
 #endif
-            return;
+            return 0;
         }
     }

--- a/src/util.h	2012-06-20 15:00:27.000000000 -0700
+++ b/src/util.h	2012-10-27 22:10:32.000000000 -0700
@@ -24,6 +24,8 @@
  *  59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.
 \*****************************************************************************/

+#include <sys/types.h>
+
 #ifdef HAVE_STDBOOL_H
 #include <stdbool.h>
 #else
