require 'formula'

class Hbase < Formula
  homepage 'http://hbase.apache.org'
  url 'http://www.apache.org/dyn/closer.cgi?path=hbase/hbase-0.98.0/hbase-0.98.0-hadoop2-bin.tar.gz'
  sha1 '95cbaf1703a3f4719f67ff0e2d3247155b49fccc'

  bottle do
    cellar :any
    sha1 "268a0a44107a0872b1c0e3c7eeeae2c87e0266e2" => :mavericks
    sha1 "11fe400379127e3391ecd008e04e30be4b427ff6" => :mountain_lion
    sha1 "b846fc66a2549973a90d03840e8fe65ef05a772d" => :lion
  end

  depends_on 'hadoop'

  def install
    rm_f Dir["bin/*.cmd", "conf/*.cmd"]
    libexec.install %w[bin conf docs lib hbase-webapps]
    bin.write_exec_script Dir["#{libexec}/bin/*"]

    inreplace "#{libexec}/conf/hbase-env.sh",
      "# export JAVA_HOME=/usr/java/jdk1.6.0/",
      "export JAVA_HOME=\"$(/usr/libexec/java_home)\""
  end

  def caveats; <<-EOS.undent
    Requires Java 1.6.0 or greater.

    You must also edit the configs in:
      #{libexec}/conf
    to reflect your environment.

    For more details:
      http://wiki.apache.org/hadoop/Hbase
    EOS
  end
end
