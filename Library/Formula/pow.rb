require 'formula'

class Pow < Formula
  homepage 'http://pow.cx/'
  url 'http://get.pow.cx/versions/0.4.3.tar.gz'
  sha1 '7e1faf3c33588bc3e73fb3583265e050a48718b0'

  bottle do
    sha1 "9985731a640ab9658c9a2ea7c3c53d64ce97c58e" => :mavericks
    sha1 "098b95c9a3415008fad30a94ff12b35fad3a19fb" => :mountain_lion
    sha1 "cf556412a870562da669886b27afd25bf309214d" => :lion
  end

  depends_on 'node'

  def install
    libexec.install Dir['*']
    (bin/'pow').write <<-EOS.undent
      #!/bin/sh
      export POW_BIN="#{HOMEBREW_PREFIX}/bin/pow"
      exec "#{HOMEBREW_PREFIX}/bin/node" "#{libexec}/lib/command.js" "$@"
    EOS
  end

  def caveats;
    <<-EOS.undent
      Create the required host directories:
        mkdir -p ~/Library/Application\\ Support/Pow/Hosts
        ln -s ~/Library/Application\\ Support/Pow/Hosts ~/.pow

      Setup port 80 forwarding and launchd agents:
        sudo pow --install-system
        pow --install-local

      Load launchd agents:
        sudo launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist
        launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist
    EOS
  end
end
