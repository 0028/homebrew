require 'formula'

class Maven < Formula
  homepage 'http://maven.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz'
  sha1 '630eea2107b0742acb315b214009ba08602dda5f'

  bottle do
    cellar :any
    sha1 '6505d875d76ede88748c85ccacbcb93d7310276f' => :mavericks
    sha1 'c8d5ccf052d83f96bf5689b67c17ad294bde7e0c' => :mountain_lion
    sha1 '67cc018880e62355ec5d25826aa233d4ef586b62' => :lion
  end

  def install
    # Remove windows files
    rm_f Dir["bin/*.bat"]

    # Fix the permissions on the global settings file.
    chmod 0644, 'conf/settings.xml'

    prefix.install_metafiles
    libexec.install Dir['*']

    # Leave conf file in libexec. The mvn symlink will be resolved and the conf
    # file will be found relative to it
    bin.install_symlink Dir["#{libexec}/bin/*"] - ["#{libexec}/bin/m2.conf"]
  end

  test do
    (testpath/'pom.xml').write <<-EOS.undent
      <?xml version="1.0" encoding="UTF-8"?>
      <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
        <modelVersion>4.0.0</modelVersion>
        <groupId>org.homebrew</groupId>
        <artifactId>maven-test</artifactId>
        <version>1.0.0-SNAPSHOT</version>
      </project>
    EOS
    (testpath/'src/main/java/org/homebrew/MavenTest.java').write <<-EOS.undent
      package org.homebrew;
      public class MavenTest {
        public static void main(String[] args) {
          System.out.println("Testing Maven with Homebrew!");
        }
      }
    EOS
    system "#{bin}/mvn", 'compile'
  end

end
