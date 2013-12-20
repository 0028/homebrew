require 'formula'

class Libsass < Formula
  homepage 'https://github.com/hcatlin/libsass'
  url 'https://github.com/hcatlin/libsass/archive/v1.0.1.tar.gz'
  sha1 '9524e028bc8ebe84e36895269d07ecc7db496c7c'

  bottle do
    cellar :any
    sha1 '24e0cf54c4aac623a29ca1a179ed9d77a07f425e' => :mavericks
    sha1 'bf34c3f5962077c11b63ea8ea6b1f5e089fa60c4' => :mountain_lion
    sha1 'd20ea34ac11f50bb0dadfea05a1e95b8ee1c87b5' => :lion
  end

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
        struct sass_options options;
        options.output_style = SASS_STYLE_NESTED;
        options.source_comments = 0;
        options.image_path = "images";
        options.include_paths = "";
        sass_ctx->source_string = "a { color:blue; &:hover { color:red; } }";
        sass_ctx->options = options;
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
