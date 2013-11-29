require 'formula'

class Sbt < Formula
  homepage 'http://www.scala-sbt.org'
  url 'http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.0/sbt-launch.jar'
  version '0.13.0'
  sha1 'b78a29b8db7ae0fc90a7890a84a4617975e1d450'

  bottle do
    sha1 'fc79cb7c91b873d5be33ed79b7bb9d3b9265c466' => :mavericks
    sha1 '1bd115a0c071b9027bb094665c5f81eb6044c19f' => :mountain_lion
    sha1 'c35206ca5a72d3d5ffd9fb2480791e550c182efb' => :lion
  end

  devel do
    url 'http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.1-RC5/sbt-launch.jar'
    version '0.13.1-RC5'
    sha1 'dae44eb4fc2f88104aa5e6aea6951cdba576fa4b'
  end

  def install
    (bin+'sbt').write <<-EOS.undent
      #!/bin/sh
      test -f ~/.sbtconfig && . ~/.sbtconfig
      exec java -Xmx512M ${SBT_OPTS} -jar #{libexec}/sbt-launch.jar "$@"
    EOS

    libexec.install Dir['*']
  end

  def caveats;  <<-EOS.undent
    You can use $SBT_OPTS to pass additional JVM options to SBT.
    For convenience, this can specified in `~/.sbtconfig`.

    For example:
        SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
    EOS
  end
end
