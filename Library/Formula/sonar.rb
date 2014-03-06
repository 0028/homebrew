require 'formula'

class Sonar < Formula
  homepage 'http://www.sonarqube.org/'
  url 'http://dist.sonar.codehaus.org/sonarqube-4.1.2.zip'
  sha1 '96a584363ecb18e55ea9c9d951d86d56e3a6d7c5'

  bottle do
    sha1 "0b5692253b462bc41398d1567de2fc1a52be2b88" => :mavericks
    sha1 "84a89f95c5f5d62ca1491a15ca34af40642443e8" => :mountain_lion
    sha1 "5a5d53b838a3e627467700523f1e882ca336b1a4" => :lion
  end

  def install
    # Delete native bin directories for other systems
    rm_rf Dir['bin/{aix,hpux,linux,solaris,windows}-*']

    if MacOS.prefer_64_bit?
      rm_rf Dir['bin/macosx-universal-32']
    else
      rm_rf Dir['bin/macosx-universal-64']
    end

    # Delete Windows files
    rm_f Dir['war/*.bat']
    libexec.install Dir['*']

    if MacOS.prefer_64_bit?
      bin.install_symlink "#{libexec}/bin/macosx-universal-64/sonar.sh" => "sonar"
    else
      bin.install_symlink "#{libexec}/bin/macosx-universal-32/sonar.sh" => "sonar"
    end
  end

  plist_options :manual => "#{HOMEBREW_PREFIX}/opt/sonar/bin/sonar console"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
        <string>#{opt_prefix}/bin/sonar</string>
        <string>start</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
    </plist>
    EOS
  end
end
