require "formula"

class Kafka < Formula
  homepage "http://kafka.apache.org"
  head "http://git-wip-us.apache.org/repos/asf/kafka.git"
  url "http://mirrors.ibiblio.org/apache/kafka/0.8.1/kafka-0.8.1-src.tgz"
  bottle do
    cellar :any
    sha1 "ded3334a0477152b53c019a9d7a87a92789b25f1" => :mavericks
    sha1 "1f5e6f72a436bb4ec5ea04bf4d37e55cc846cfa0" => :mountain_lion
    sha1 "a834648c26f088c959be2ed0978b5cf2eb9d39d4" => :lion
  end

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

    mv "config", "kafka"
    etc.install "kafka"
    libexec.install_symlink etc/"kafka" => "config"
  end

  def caveats; <<-EOS.undent
    To start Kafka, ensure that ZooKeeper is running and then execute:
      kafka-server-start.sh #{etc}/kafka/server.properties
    EOS
  end
end
