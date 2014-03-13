require "formula"

class Kafka < Formula
  homepage "http://kafka.apache.org"
  head "http://git-wip-us.apache.org/repos/asf/kafka.git"
  url "http://mirrors.ibiblio.org/apache/kafka/0.8.1/kafka-0.8.1-src.tgz"
  bottle do
    cellar :any
    sha1 "fa914460e96f1b75c6a3984c403eebfd3d64f485" => :mavericks
    sha1 "1e10e5be6c04fd26b7aee96f2bd92bcc19d0be39" => :mountain_lion
    sha1 "74a8cc90936c710962841baadf61ecdb126d4858" => :lion
  end

  mirror "http://apache.cs.utah.edu/kafka/0.8.1/kafka-0.8.1-src.tgz"
  mirror "http://psg.mtu.edu/pub/apache/kafka/0.8.1/kafka-0.8.1-src.tgz"
  mirror "http://www.gtlib.gatech.edu/pub/apache/kafka/0.8.1/kafka-0.8.1-src.tgz"
  mirror "http://mirrors.koehn.com/apache/kafka/0.8.1/kafka-0.8.1-src.tgz"
  mirror "http://mirror.sdunix.com/apache/kafka/0.8.1/kafka-0.8.1-src.tgz"
  sha1 "af88a986ef711f5fd30063a9cb3395e63884bf0b"

  depends_on "zookeeper"

  def install
    system "./gradlew", "jar"

    # Use 1 partition by default so individual consumers receive all topic messages
    inreplace "config/server.properties", "num.partitions=2", "num.partitions=1"

    logs = var/"log/kafka"
    inreplace "config/log4j.properties", "kafka.logs.dir=logs", "kafka.logs.dir=#{logs}"
    inreplace "config/test-log4j.properties", ".File=logs/", ".File=#{logs}/"

    data = var/"lib"
    inreplace "config/server.properties",
      "log.dirs=/tmp/kafka-logs", "log.dirs=#{data}/kafka-logs"

    inreplace "config/zookeeper.properties",
      "dataDir=/tmp/zookeeper", "dataDir=#{data}/zookeeper"

    libexec.install %w(contrib core examples lib perf system_test)

    prefix.install "bin"
    bin.env_script_all_files(libexec/"bin", :JAVA_HOME => "`/usr/libexec/java_home`")

    (etc/"kafka").install Dir["config/*"]
    libexec.install_symlink etc/"kafka" => "config"
  end

  def caveats; <<-EOS.undent
    To start Kafka, ensure that ZooKeeper is running and then execute:
      kafka-server-start.sh #{etc}/kafka/server.properties
    EOS
  end
end
