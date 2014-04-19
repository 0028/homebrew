require 'formula'

class Couchpotatoserver < Formula
  homepage 'https://couchpota.to'
  url 'https://github.com/RuudBurger/CouchPotatoServer/archive/build/2.4.0.tar.gz'
  sha1 '63c0f89a2d49c7bf1e3b7425f48ff3d2b322d800'

  head 'https://github.com/RuudBurger/CouchPotatoServer.git'

  bottle do
    sha1 "cb8cfc84f1bff668439b5235e1b34001e898c9fa" => :mavericks
    sha1 "3a7b8fcc1d72dcb6983066b8ecfd5fdb857e4400" => :mountain_lion
    sha1 "740c6b5ca91ecb42e66d4c9059622c689a9c6890" => :lion
  end

  def install
    prefix.install_metafiles
    libexec.install Dir['*']
    (bin+"couchpotatoserver").write(startup_script)
  end

  plist_options :manual => 'couchpotatoserver'

  def plist; <<-EOS.undent
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>Program</key>
        <string>#{opt_bin}/couchpotatoserver</string>
        <key>ProgramArguments</key>
        <array>
          <string>--quiet</string>
          <string>--daemon</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>UserName</key>
        <string>#{`whoami`.chomp}</string>
      </dict>
    </plist>
    EOS
  end

  def startup_script; <<-EOS.undent
    #!/bin/bash
    python "#{libexec}/CouchPotato.py"\
           "--pid_file=#{var}/run/couchpotatoserver.pid"\
           "--data_dir=#{etc}/couchpotatoserver"\
           "$@"
    EOS
  end

  def caveats
    "CouchPotatoServer defaults to port 5050."
  end
end
