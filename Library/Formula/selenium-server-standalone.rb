require 'formula'

class SeleniumServerStandalone < Formula
  homepage 'http://seleniumhq.org/'
  url 'https://selenium-release.storage.googleapis.com/2.40/selenium-server-standalone-2.40.0.jar'
  sha1 '165f54ca53e5eefc6f27c26ac03d18bae99a544e'

  bottle do
    sha1 "47c00f3c51fbea9dfd27c8b22d96e8768cdb9094" => :mavericks
    sha1 "a0ca9d6cb168b228c7dcf7309f2e079187b33d80" => :mountain_lion
    sha1 "5be51c737963ac40275c5160c21ace6b831d6fff" => :lion
  end

  def install
    libexec.install "selenium-server-standalone-#{version}.jar"
    bin.write_jar_script libexec/"selenium-server-standalone-#{version}.jar", "selenium-server"
  end

  plist_options :manual => "selenium-server -p 4444"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <false/>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/bin/java</string>
        <string>-jar</string>
        <string>#{libexec}/selenium-server-standalone-#{version}.jar</string>
        <string>-port</string>
        <string>4444</string>
      </array>
      <key>ServiceDescription</key>
      <string>Selenium Server</string>
      <key>StandardErrorPath</key>
      <string>/var/log/selenium/selenium-error.log</string>
      <key>StandardOutPath</key>
      <string>/var/log/selenium/selenium-output.log</string>
    </dict>
    </plist>
    EOS
  end
end
