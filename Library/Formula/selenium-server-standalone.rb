require 'formula'

class SeleniumServerStandalone < Formula
  homepage 'http://seleniumhq.org/'
  url 'http://selenium.googlecode.com/files/selenium-server-standalone-2.38.0.jar'
  sha1 'c717aea5c601fe657825db280b4788ee97b34f97'

  bottle do
    sha1 'c0d2504242ac739106003c01901fcf40b6f91f7c' => :mavericks
    sha1 '08b1ddbce1f23b66f91517d126b7cd321ed3278e' => :mountain_lion
    sha1 'dd11317bfdabe0cd27d57787f46450f6ad907d01' => :lion
  end

  def install
    prefix.install "selenium-server-standalone-#{version}.jar"
  end

  plist_options :manual => "java -jar #{HOMEBREW_PREFIX}/opt/selenium-server-standalone/selenium-server-standalone-#{version}.jar -p 4444"

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
        <string>#{prefix}/selenium-server-standalone-#{version}.jar</string>
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
