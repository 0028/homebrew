require "formula"

class Duckdns < Formula
  homepage "http://jzelinskie.com/duckdns"
  url "https://github.com/jzelinskie/duckdns/archive/1.0.tar.gz"
  sha1 "93d8efd9e6862a678ce3a7b0e07d6ab19d8f9af6"

  bottle do
    sha1 "0dc6b33e704dc4aaf59372a9fcc73ce123447dc8" => :mavericks
    sha1 "872de29c223569a75d9ef25050ce4c1f7097a87a" => :mountain_lion
    sha1 "5cce83aaeda687dce74bce9dc4906926a031db15" => :lion
  end

  def install
    bin.install "duckdns"
  end

  test do
    system "#{bin}/duckdns"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/duckdns</string>
      </array>
      <key>StartInterval</key>
      <integer>300</integer>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
    EOS
  end
end

