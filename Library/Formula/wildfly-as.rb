require 'formula'

class WildflyAs < Formula
  homepage 'http://wildfly.org/'
  url 'http://download.jboss.org/wildfly/8.0.0.Final/wildfly-8.0.0.Final.tar.gz'
  sha1 '594f78aa04dd35c936615563ff3777a67228ba9d'

  bottle do
    cellar :any
    sha1 "7ea7e7c79674b7c9975e916e40c3ab221f31af44" => :mavericks
    sha1 "acf9d3908427b20365700e23157baa41aa1712a1" => :mountain_lion
    sha1 "b7d054738f2639ff714fc26ef52e47d985b1e622" => :lion
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install Dir['*']
  end

  def caveats; <<-EOS.undent
    The home of WildFly Application Server 8 is:
      #{opt_prefix}/libexec

    You may want to add the following to your .bash_profile:
      export JBOSS_HOME=#{opt_prefix}/libexec
      export PATH=${PATH}:${JBOSS_HOME}/bin

    Note: WildFly 8 still uses JBOSS_HOME, do not use WILDFLY_HOME or something like that.

    Note: The support scripts used by WildFly Application Server 7 have
    very generic names. These are likely to conflict with support scripts
    used by other Java-based server software. Hence they are *NOT* linked
    to bin.
  EOS
  end
end
