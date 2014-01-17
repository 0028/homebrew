require 'formula'

class Ant < Formula
  homepage 'http://ant.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=ant/binaries/apache-ant-1.9.3-bin.tar.gz'
  sha1 '11a0b936fba02f96b8d737d90c610382232ffea6'

  bottle do
    cellar :any
    sha1 '39a04559b1718d192f4a1a46d47f4b1cbc40d8c6' => :mavericks
    sha1 '364a9d392e2b790e7e4df5859c6b62b9e31c509a' => :mountain_lion
    sha1 '4fece2081f6b961b909bbd408a56fdfcde4aafe6' => :lion
  end

  keg_only :provided_by_osx if MacOS.version < :mavericks

  def install
    rm Dir['bin/*.{bat,cmd,dll,exe}']
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/'build.xml').write <<-EOS.undent
      <project name="HomebrewTest" basedir=".">
        <property name="src" location="src"/>
        <property name="build" location="build"/>
        <target name="init">
          <mkdir dir="${build}"/>
        </target>
        <target name="compile" depends="init">
          <javac srcdir="${src}" destdir="${build}"/>
        </target>
      </project>
    EOS
    (testpath/'src/main/java/org/homebrew/AntTest.java').write <<-EOS.undent
      package org.homebrew;
      public class AntTest {
        public static void main(String[] args) {
          System.out.println("Testing Ant with Homebrew!");
        }
      }
    EOS
    system "#{bin}/ant", "compile"
  end
end
