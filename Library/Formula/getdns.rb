require "formula"

class Getdns < Formula
  homepage "http://getdnsapi.net"
  url "http://getdnsapi.net/dist/getdns-0.1.0.tar.gz"
  sha1 "176d7a6d16ec5e0cfb8d34a303be1ccdbb0b4e5d"

  bottle do
    sha1 "943763090a5dc4b487ddd4b847fb4f5bb80545c0" => :mavericks
    sha1 "dc0e4608ea6ffee89e172203f8da088ac2e513b9" => :mountain_lion
    sha1 "6b0ce3497efad8584470a8d8b2f734b3c6576437" => :lion
  end

  depends_on "ldns"
  depends_on "unbound"
  depends_on "libidn"
  depends_on "libevent"
  depends_on "libuv" => :optional

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <getdns/getdns.h>

      int main(int argc, char *argv[]) {
        getdns_context *context;
        getdns_dict *api_info;
        char *pp;
        getdns_return_t r = getdns_context_create(&context, 0);
        if (r != GETDNS_RETURN_GOOD) {
            return -1;
        }
        api_info = getdns_context_get_api_information(context);
        if (!api_info) {
            return -1;
        }
        pp = getdns_pretty_print_dict(api_info);
        if (!pp) {
            return -1;
        }
        puts(pp);
        getdns_dict_destroy(api_info);
        getdns_context_destroy(context);
        return 0;
      }
    EOS
    system ENV.cc, "-I#{include}", "-o", "test", "test.c", "-lgetdns"
    system "./test"
  end
end
