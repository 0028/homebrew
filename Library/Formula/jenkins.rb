require 'formula'

class Jenkins < Formula
  homepage 'http://jenkins-ci.org'
  url 'http://mirrors.jenkins-ci.org/war/1.559/jenkins.war'
  sha1 '1b9758b976be9510948d5a058324d76b6d6459f4'

  head 'https://github.com/jenkinsci/jenkins.git'

  bottle do
    sha1 "d437a6a67975ef1a34e988041b114061f9b24182" => :mavericks
    sha1 "a84b047d9d3cf40c3b2860247446cdd8dc88d024" => :mountain_lion
    sha1 "6aab76c902d6b76d18b0feaee2186cc8c66c565c" => :lion
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
