require 'formula'

class Hive < Formula
  homepage 'http://hive.apache.org'
  url 'http://www.apache.org/dyn/closer.cgi?path=hive/hive-0.12.0/hive-0.12.0-bin.tar.gz'
  sha1 '488f625a859facc89312320ef7e9802f1cc2531e'

  bottle do
    sha1 '03fe28faa885ff46ccffeb27e7f8e188d806cea8' => :mavericks
    sha1 'c87cceded037a298fc7ed9440050e1484416bd1f' => :mountain_lion
    sha1 'e97fcc5ef2a22257ac82e5a275bef21cd19b0dab' => :lion
  end

  depends_on 'hadoop'
  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin conf examples lib ]
    libexec.install Dir['*.jar']
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    Hadoop must be in your path for hive executable to work.
    After installation, set $HIVE_HOME in your profile:
      export HIVE_HOME=#{libexec}

    You may need to set JAVA_HOME:
      export JAVA_HOME="$(/usr/libexec/java_home)"
    EOS
  end
end
