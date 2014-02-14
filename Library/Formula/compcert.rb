require "formula"

class Compcert < Formula
  homepage "http://compcert.inria.fr"
  url "http://compcert.inria.fr/release/compcert-2.1.tgz"
  sha1 "1ec21e43c3ac778827522d385733e36d24c5f8d4"

  bottle do
    sha1 "e6e9664300ad72f436e9cc9292650abc03f94363" => :mavericks
    sha1 "019d5ed695270c7458eb922c9243bfc4d929ed08" => :mountain_lion
    sha1 "f72503a3c2959864b4911427bea4544e8de08405" => :lion
  end

  depends_on "coq" => :build
  depends_on "objective-caml" => :build
  depends_on "camlp5" => :build

  def install

    # Compcert's configure script hard-codes gcc. On Lion and under, this
    # creates problems since XCode's gcc does not support CFI.
    inreplace 'configure', '${toolprefix}gcc', "${toolprefix}#{ENV.cc}"

    system "./configure", "-prefix", prefix, "ia32-macosx"
    system "make", "all"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <stdio.h>
      int main(int argc, char** argv) {
        printf("Hello, world!\n");
        return 0;
      }
    EOS
    system "#{bin}/ccomp", "test.c", "-o", "test"
    system "./test"
  end
end
