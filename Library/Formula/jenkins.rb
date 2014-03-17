require 'formula'

class Jenkins < Formula
  homepage 'http://jenkins-ci.org'
  url 'http://mirrors.jenkins-ci.org/war/1.555/jenkins.war'
  sha1 'd69ab68664916694649791fe23541301de5f47e2'

  head 'https://github.com/jenkinsci/jenkins.git'

  bottle do
    sha1 "9bdadb74cd19a5f7551a329dbda653a0a0f7812c" => :mavericks
    sha1 "6c980cab32b2c7111a04dfee9c8dac078c180eaf" => :mountain_lion
    sha1 "01b85e21f7406a64510b5149dc9d99674c55a6ef" => :lion
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
