require 'formula'

class SeleniumServerStandalone < Formula
  homepage 'http://seleniumhq.org/'
  url 'http://selenium.googlecode.com/files/selenium-server-standalone-2.39.0.jar'
  sha1 'f2391600481dd285002d04b66916fc4286ff70ce'

  bottle do
    sha1 '1c22d0aadf8fb00afdc34277c7bb523232cd1179' => :mavericks
    sha1 'd1f1d23d7e77fdead2ff51e1221a9c09b073f683' => :mountain_lion
    sha1 '72a1f4296a5d60b8c78ddf316ccad0a524f714f5' => :lion
  end

  def install
    libexec.install "selenium-server-standalone-#{version}.jar"
    bin.write_jar_script libexec/"selenium-server-standalone-#{version}.jar", "selenium-server"
  end

  def caveats; <<-EOS.undent
    The simplest way to run the server is via the included executable:
        selenium-server -p 4444
    EOS
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
