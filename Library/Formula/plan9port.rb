require "formula"

class Plan9port < Formula
  homepage "http://swtch.com/plan9port/"
  url "https://plan9port.googlecode.com/files/plan9port-20140306.tgz"
  sha1 "b778a96558e2b67be28ae80cab4482ef3082ec0e"

  bottle do
    sha1 "1a0361d82e1a26dc7822931efe1d9f4f40a43c10" => :mavericks
    sha1 "b70f18ab1aaac5d28b79ee339fba49f1b3e08d65" => :mountain_lion
    sha1 "80f47c95f975c075778396feadecc4e419737890" => :lion
  end

  def install
    ENV["PLAN9_TARGET"] = libexec
    system "./INSTALL"

    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/9"]
    prefix.install Dir["#{libexec}/mac/*.app"]
  end

  def caveats; <<-EOS.undent
    In order not to collide with OSX system binaries, the Plan 9 binaries have
    been installed to #{libexec}/bin.
    To run the Plan 9 version of a command simply call it through the command
    "9", which has been installed into the Homebrew prefix bin.  For example,
    to run Plan 9's ls run:
        # 9 ls
    EOS
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
