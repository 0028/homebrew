require 'formula'

class Gitbucket < Formula
  homepage 'https://github.com/takezoe/gitbucket'
  url 'https://github.com/takezoe/gitbucket/releases/download/1.12/gitbucket.war'
  sha1 'aee08693cabd18ab23d0060d52b204cc71ccc626'

  bottle do
    sha1 "216fbd83384185cb47e30fa5d2d9124b86030ddd" => :mavericks
    sha1 "b4e85530860f9ac5de7598fc50502123375036db" => :mountain_lion
    sha1 "8e30bf11070f1b2860ac1ec68ef0fb70525f23fb" => :lion
  end

  head do
    url 'https://github.com/takezoe/gitbucket.git'
    depends_on 'ant' => :build
  end

  def install
    if build.head?
      system "ant"
      libexec.install "war/target/gitbucket.war", "."
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
          <string>#{opt_libexec}/gitbucket.war</string>
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
