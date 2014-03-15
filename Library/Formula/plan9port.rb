require "formula"

class Plan9port < Formula
  homepage "http://swtch.com/plan9port/"
  url "https://plan9port.googlecode.com/files/plan9port-20140306.tgz"
  sha1 "b778a96558e2b67be28ae80cab4482ef3082ec0e"

  bottle do
    sha1 "211dffa87ebbdeed81ef75715a10ecb8cfe96118" => :mavericks
    sha1 "c4bc003967b9ee70e29dcbced3cfc165cceafd52" => :mountain_lion
    sha1 "37af63c0b7f544677779e73ec984382b725458f2" => :lion
  end

  def install
    ENV["PLAN9_TARGET"] = libexec
    system "./INSTALL"

    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/9"]
    prefix.install Dir["#{libexec}/mac/*.app"]
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <u.h>
      #include <libc.h>
      #include <stdio.h>

      int main(void) {
        return printf("Hello World\\n");
      }
    EOS
    system "#{bin}/9", "9c", "test.c"
    system "#{bin}/9", "9l", "-o", "test", "test.o"
    assert_equal "Hello World\n", `./test`
  end
end
