require 'formula'

class Libsigcxx < Formula
  homepage 'http://libsigc.sourceforge.net'
  url 'https://download.gnome.org/sources/libsigc++/2.3/libsigc++-2.3.1.tar.xz',
      :using => :ssl3
  sha256 '67d05852b31fdb267c9fdcecd40b046a11aa54d884435e99e3c60dd20cd60393'

  bottle do
    revision 1
    sha1 "5e6e265bcdc93bf4d4903ffa03be9fcb7500800e" => :mavericks
    sha1 "e7dc898d19b027fa93b0594830d5a9a0fcd3d4fc" => :mountain_lion
    sha1 "630d131881eb65eb3856dcbae3cfc26be009e340" => :lion
  end

  option :cxx11

  # apply this patch for C++11 mode
  # see https://git.gnome.org/browse/libsigc++2/commit/tests/test_cpp11_lambda.cc?id=cd600a31fbf8e76e25f4be4c10c0645f090a9b80
  patch :DATA if build.cxx11?

  def install
    ENV.cxx11 if build.cxx11?
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make"
    system "make check"
    system "make install"
  end
end
__END__
diff -u a/tests/test_cpp11_lambda.cc b/tests/test_cpp11_lambda.cc
--- a/tests/test_cpp11_lambda.cc
+++ b/tests/test_cpp11_lambda.cc
@@ -312,7 +312,7 @@

   //std::cout << (sigc::group(sigc::mem_fun(&bar::test), _1, _2, _3)) (sigc::ref(the_bar), 1, 2) << std::endl;
   result_stream << std::bind(std::mem_fn(&bar::test), std::placeholders::_1,
-    std::placeholders::_2, std::placeholders::_3)(std::ref(the_bar), 1, 2);
+    std::placeholders::_2, std::placeholders::_3)(the_bar, 1, 2);
   check_result("bar::test(int 1, int 2)6");

   // same functionality as bind
