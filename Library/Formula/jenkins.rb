require 'formula'

class Jenkins < Formula
  homepage 'http://jenkins-ci.org'
  url 'http://mirrors.jenkins-ci.org/war/1.558/jenkins.war'
  sha1 'c70e47078a2d11141146ebae5dcd470387df43fd'

  head 'https://github.com/jenkinsci/jenkins.git'

  bottle do
    sha1 "881d5c5e5431905a6f427ff40f7db239ecc0a772" => :mavericks
    sha1 "13ecf66bf878d95bbd9084a17bd1ace48b7163a1" => :mountain_lion
    sha1 "610275d537af731fe0d54866d1b5288149a82173" => :lion
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
