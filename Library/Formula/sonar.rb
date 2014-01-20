require 'formula'

class Sonar < Formula
  homepage 'http://www.sonarqube.org/'
  url 'http://dist.sonar.codehaus.org/sonarqube-4.1.zip'
  sha1 '98c5377344ab508e819952b00f6c05bacfc14ac6'

  bottle do
    sha1 "a4138fe8aa93e47c1f785fc04d2e67e318ea6e3e" => :mavericks
    sha1 "e5d165c37a0bbe2251bb2fd8d35ed2ea1595116b" => :mountain_lion
    sha1 "056350e87e16133f3522f062c982c3ab2879e309" => :lion
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
