require "formula"

class Influxdb < Formula
  homepage "http://influxdb.org"
  url "http://get.influxdb.org/influxdb-0.4.1.src.tar.gz"
  sha1 "f452cfce6e08f56e0fd6071d2a127446c165e08b"

  bottle do
    revision 2
    sha1 "d840c8d45d0f595ba054d489293c30cd58791a81" => :mavericks
    sha1 "9b9c55aa8060b9f511d9785b8247c21dc3f989b5" => :mountain_lion
    sha1 "c1db8361dae00f6fbc2c9c5e1c1fb2bf3666d188" => :lion
  end

  devel do
    url "http://get.influxdb.org/influxdb-0.5.0-rc.5.src.tar.gz"
    sha1 "8dd4a61d7557446b0846921c9d93111445d35a72"
  end

  depends_on "leveldb"
  depends_on "protobuf" => :build
  depends_on "bison" => :build
  depends_on "flex" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    flex = Formula["flex"].bin/"flex"
    bison = Formula["bison"].bin/"bison"

    system "./configure", "--with-flex=#{flex}", "--with-bison=#{bison}"
    system "make", "dependencies", "protobuf", "parser"
    system "go", "build", "daemon"

    inreplace "config.toml.sample" do |s|
      s.gsub! "/tmp/influxdb/development/db", "#{var}/influxdb/data"
      s.gsub! "/tmp/influxdb/development/raft", "#{var}/influxdb/raft"
      s.gsub! "/tmp/influxdb/development/wal", "#{var}/influxdb/wal"
      s.gsub! "./admin", "#{opt_share}/admin"
    end

    bin.install "daemon" => "influxdb"
    etc.install "config.toml.sample" => "influxdb.conf"
    share.install "admin"

    (var/"influxdb/data").mkpath
    (var/"influxdb/raft").mkpath
  end

  plist_options :manual => "influxdb -config=#{HOMEBREW_PREFIX}/etc/influxdb.conf"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <dict>
          <key>SuccessfulExit</key>
          <false/>
        </dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/influxdb</string>
          <string>-config=#{etc}/influxdb.conf</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{var}</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/influxdb.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/influxdb.log</string>
      </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/influxdb", "-v"
  end
end
