require 'formula'

class Jenkins < Formula
  homepage 'http://jenkins-ci.org'
  url 'http://mirrors.jenkins-ci.org/war/1.547/jenkins.war'
  sha1 '951e9f553a37db036a05d3d33750481a23fc40ac'

  head 'https://github.com/jenkinsci/jenkins.git'

  bottle do
    sha1 "6fdf0c7f5c445faaf30f9c43b88f8784fe9bbb33" => :mavericks
    sha1 "a8c182a214bbcc9e3e0df7cba2342b5749fb8ca4" => :mountain_lion
    sha1 "045981f796f4d54e5bec10a8750e0b06a1b2d4ae" => :lion
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
          <string>#{opt_prefix}/libexec/jenkins.war</string>
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
