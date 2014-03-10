require 'formula'

class Jenkins < Formula
  homepage 'http://jenkins-ci.org'
  url 'http://mirrors.jenkins-ci.org/war/1.554/jenkins.war'
  sha1 '16bbf07bd71c26b2525b9990a7e1665d7e65b37c'

  head 'https://github.com/jenkinsci/jenkins.git'

  bottle do
    sha1 "d54ebdd6f8c6a36e737ba87f66986fe31899f1e9" => :mavericks
    sha1 "fadcddc40c2a7a27675d02e15e097d206bec0115" => :mountain_lion
    sha1 "3750326a927ffd300965e44c401dac4de1af5a4c" => :lion
  end

  def install
    if build.head?
      system "mvn clean install -pl war -am -DskipTests"
      libexec.install 'war/target/jenkins.war', '.'
    else
      libexec.install "jenkins.war"
    end
  end

  plist_options :manual => "java -jar #{HOMEBREW_PREFIX}/opt/jenkins/libexec/jenkins.war"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>/usr/bin/java</string>
          <string>-Dmail.smtp.starttls.enable=true</string>
          <string>-jar</string>
          <string>#{opt_libexec}/jenkins.war</string>
          <string>--httpListenAddress=127.0.0.1</string>
          <string>--httpPort=8080</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
      </dict>
    </plist>
  EOS
  end

  def caveats; <<-EOS.undent
    Note: When using launchctl the port will be 8080.
    EOS
  end
end
