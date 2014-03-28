require "formula"

class Pmd < Formula
  homepage "http://pmd.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/pmd/pmd/5.1.0/pmd-src-5.1.0.zip"
  sha1 "5dff0c4ca2853c464ce4634079809bdf54918923"

  bottle do
    cellar :any
    sha1 "6bfb5714ef6434a3e7a38dcbf8f1d14f23d14b42" => :mavericks
    sha1 "fd033afc2d55a107c3a63766ff2d6777113d037b" => :mountain_lion
    sha1 "d1f9a6190affab557281325d876ef0dceebd95c8" => :lion
  end

  def install
    rm Dir["bin/*.{bat,cmd,dll,exe}"]
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/run.sh" => "pmd"

    # the run script references paths which don't account for the
    # file structure of this brew.
    inreplace "#{libexec}/bin/run.sh", "/../lib", "/../libexec/lib"
  end

  def caveats; <<-EOS.undent
    Use `pmd` instead of run.sh as described in the official documentation.
    EOS
  end

  test do
    (testpath/"java/testClass.java").write <<-EOS.undent
      public class BrewTestClass {
        // dummy constant
        public String SOME_CONST = "foo";

        public boolean doTest () {
          return true;
        }
      }
    EOS

    system "#{bin}/pmd", "pmd", "-d", "#{testpath}/java", "-R",
      "rulesets/java/basic.xml", "-f", "textcolor", "-l", "java"
  end
end
