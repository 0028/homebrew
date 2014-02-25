require 'formula'

class Mahout < Formula
  homepage 'http://mahout.apache.org/'
  head 'http://svn.apache.org/repos/asf/mahout/trunk'
  url 'http://apache.cs.utah.edu/mahout/0.9/mahout-distribution-0.9.tar.gz'
  sha1 'b0d192a33dcc3f00439bf2ffbc313c6ef47510c3'

  bottle do
    sha1 "dc5ea84dffc2292a0d937a79674038f25e8ea0b8" => :mavericks
    sha1 "5f362de892e3443d78d236f58034b40f3fd0cd2e" => :mountain_lion
    sha1 "7961be14ce3f15a7939a4fb815bec92e9f8ec858" => :lion
  end

  depends_on 'maven' => :build
  depends_on 'hadoop'

  def install
    if build.head?
      system 'chmod 755 ./bin'
      system 'mvn -DskipTests clean install'
    end

    libexec.install %w[bin]

    if build.head?
      libexec.install Dir['buildtools/target/*.jar']
      libexec.install Dir['core/target/*.jar']
      libexec.install Dir['examples/target/*.jar']
      libexec.install Dir['math/target/*.jar']
    else
      libexec.install Dir['*.jar']
    end

    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    Mahout requires JAVA_HOME to be set:
      export JAVA_HOME=$(/usr/libexec/java_home)
    EOS
  end
end
