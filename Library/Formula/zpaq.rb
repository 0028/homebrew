require "formula"

class Zpaq < Formula
  homepage "http://mattmahoney.net/dc/zpaq.html"
  url "http://mattmahoney.net/dc/zpaq649.zip"
  sha1 "aa0d8241679f314d0be8a43e7a87e5b4d4529017"
  version "6.49"

  bottle do
    cellar :any
    sha1 "9154547c4e3b21c9be3a4f23d40af2d138c4d28a" => :mavericks
    sha1 "4837a5489b21ede77e0b79b873072943285d70d8" => :mountain_lion
    sha1 "fa1a1117db26d69ae3ed0738b6fb5a703fce8414" => :lion
  end

  def install
    ENV.append_to_cflags "-Dunix -O3"
    system "make", "libzpaq.o", "divsufsort.o", "zpaq.o"
    system "ar", "-r", "libzpaq.a", "libzpaq.o", "divsufsort.o"
    system ENV.cxx, "-o", "zpaq", "libzpaq.a", "zpaq.o"
    lib.install "libzpaq.a"
    include.install "libzpaq.h"
    bin.install "zpaq"
  end

  test do
    archive = testpath/'test.zpaq'
    zpaq = bin/"zpaq"
    system zpaq, "a", archive, "#{include}/libzpaq.h"
    system zpaq, "t", archive
    archive.read(4) == "7kSt"
  end
end
