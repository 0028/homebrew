require 'formula'

class Gitbucket < Formula
  homepage 'https://github.com/takezoe/gitbucket'
  url 'https://github.com/takezoe/gitbucket/releases/download/1.8/gitbucket.war'
  sha1 'abdd921283e25e6663c49798df0bfb0287c0eb9c'

  bottle do
    sha1 'd949237040e006897203c888501399c8ab378db9' => :mavericks
    sha1 'e5130c8c78006b16745387e58ff9917826366d10' => :mountain_lion
    sha1 'b07a335ef4c61987eee426340b01468e68800764' => :lion
  end

  head do
    url 'https://github.com/takezoe/gitbucket.git'
    depends_on 'ant' => :build
  end

  def install
    if build.head?
      system "ant"
      libexec.install 'war/target/gitbucket.war', '.'
    else
      libexec.install "gitbucket.war"
    end
  end

  plist_options :manual => "java -jar #{HOMEBREW_PREFIX}/opt/gitbucket/libexec/gitbucket.war"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>gitbucket</string>
        <key>ProgramArguments</key>
        <array>
          <string>/usr/bin/java</string>
          <string>-Dmail.smtp.starttls.enable=true</string>
          <string>-jar</string>
          <string>#{opt_prefix}/libexec/gitbucket.war</string>
          <string>--host=127.0.0.1</string>
          <string>--port=8080</string>
          <string>--https=true</string>
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
