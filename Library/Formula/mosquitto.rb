require "formula"

class Mosquitto < Formula
  homepage "http://mosquitto.org/"
  url "http://mosquitto.org/files/source/mosquitto-1.3.1.tar.gz"
  sha1 "dcba02c12dffa27a0e76e68f88de21fb5f7de29d"

  bottle do
    revision 1
    sha1 "fb036bae9f0b8b0e0a5b4dc9893e40023a840c95" => :mavericks
    sha1 "f3d1a6b06a73b91d3b781bbede8c9ec7e4c01f56" => :mountain_lion
    sha1 "22734399f4d5fdaabb1a7e4038a855ab0bea514c" => :lion
  end

  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "c-ares"

  # mosquitto requires OpenSSL >=1.0 for TLS support
  depends_on "openssl"

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"

    # Create the working directory
    (var/"mosquitto").mkpath
  end

  test do
    quiet_system "#{sbin}/mosquitto", "-h"
    assert_equal 3, $?.exitstatus
  end

  def caveats; <<-EOD.undent
    mosquitto has been installed with a default configuration file.
    You can make changes to the configuration by editing:
        #{etc}/mosquitto/mosquitto.conf

    Python client bindings can be installed from the Python Package Index:
        pip install mosquitto

    Javascript client has been removed, see Eclipse Paho for an alternative.
    EOD
  end

  plist_options :manual => "mosquitto -c #{HOMEBREW_PREFIX}/etc/mosquitto/mosquitto.conf"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_sbin}/mosquitto</string>
        <string>-c</string>
        <string>#{etc}/mosquitto/mosquitto.conf</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <false/>
      <key>WorkingDirectory</key>
      <string>#{var}/mosquitto</string>
    </dict>
    </plist>
    EOS
  end
end
