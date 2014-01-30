require 'formula'

class Sonar < Formula
  homepage 'http://www.sonarqube.org/'
  url 'http://dist.sonar.codehaus.org/sonarqube-4.1.1.zip'
  sha1 '3a6f2effb67104bfc90b88b0627c105cf6089f8b'

  bottle do
    sha1 "0c2e69bee2980847c15bcf03fe0be41be54fbff7" => :mavericks
    sha1 "bbf9b6a23666603149a698e17a05efc70715b223" => :mountain_lion
    sha1 "72667a5562ba1b38dd8b976d9f49ddfb3d73a93d" => :lion
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
