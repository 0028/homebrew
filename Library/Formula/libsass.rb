require 'formula'

class Libsass < Formula
  homepage 'https://github.com/hcatlin/libsass'
  url 'https://github.com/hcatlin/libsass/archive/v1.0.1.tar.gz'
  sha1 '9524e028bc8ebe84e36895269d07ecc7db496c7c'

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  def install
    system "autoreconf -i"
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <sass_interface.h>
      #include <string.h>

      int main()
      {
        struct sass_context* sass_ctx = sass_new_context();
        sass_ctx->source_string = "a { color:blue; &:hover { color:red; } }";
        sass_ctx->options.output_style = SASS_STYLE_NESTED;
        sass_compile(sass_ctx);
        if(sass_ctx->error_status) {
          return 1;
        } else {
          return strcmp(sass_ctx->output_string, "a {\\n  color: blue; }\\n  a:hover {\\n    color: red; }\\n") != 0;
        }
      }
    EOS
    system ENV.cc, "-o", "test", "test.c", "-lsass"
    system "./test"
  end
end
