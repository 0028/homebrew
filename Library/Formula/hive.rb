require 'formula'

class Hive < Formula
  homepage 'http://hive.apache.org'
  url 'http://www.apache.org/dyn/closer.cgi?path=hive/hive-0.12.0/hive-0.12.0-bin.tar.gz'
  sha1 '488f625a859facc89312320ef7e9802f1cc2531e'

  bottle do
    sha1 'c8cc73a315a79ccd8c34ace630635ec9c7045e09' => :mavericks
    sha1 'ced3210df209b144a30eb25b6e55dccebfafc2e3' => :mountain_lion
    sha1 'fd37515eeb780afffd8f41fa3ec5cb1f9cf74374' => :lion
  end

  depends_on 'hadoop'

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin conf examples hcatalog lib]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    Hadoop must be in your path for hive executable to work.
    After installation, set $HIVE_HOME in your profile:
      export HIVE_HOME=#{libexec}

    If you want to use HCatalog with Pig, set $HCAT_HOME in your profile:
      export HCAT_HOME=#{libexec}/hcatalog

    You may need to set JAVA_HOME:
      export JAVA_HOME="$(/usr/libexec/java_home)"
    EOS
  end
end
