require "formula"

class AntContrib < Formula
  homepage "http://ant-contrib.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.tar.gz"
  sha1 "05b74808d51f501a993457fb9b7871484acba901"
  version "1.0b3"

  bottle do
    cellar :any
    sha1 "1eacd1255e4c7b3e69a2ab8c4d5aeb2d9b718733" => :mavericks
    sha1 "214aea3f173ddb9c1aec7b26742601d970954153" => :mountain_lion
    sha1 "21c6367c57e1ae7eb90c660acb52d4eb0bbfc60c" => :lion
  end

  depends_on "ant"

  def install
    libexec.install "lib", "ant-contrib-1.0b3.jar"
    share.install "docs"
  end

  test do
    (testpath/"build.xml").write <<-EOS.undent
      <project name="HomebrewTest" default="init" basedir=".">
        <taskdef resource="net/sf/antcontrib/antcontrib.properties"/>
        <target name="init">
          <if>
            <equals arg1="BREW" arg2="BREW" />
            <then>
              <echo message="Test passes!"/>
            </then>
          </if>
        </target>
      </project>
    EOS
    system Formula["ant"].opt_bin/"ant", "-lib", libexec
  end
end
