require 'formula'

class Nexus < Formula
  homepage 'http://www.sonatype.org/'
  url 'http://download.sonatype.com/nexus/oss/nexus-2.7.1-01-bundle.tar.gz'
  version '2.7.1-01'
  sha1 '2f46fbe6e53c2d62b71f982bc4b59ac912092326'

  bottle do
    sha1 '1e2b732948fe5c6c37ac2685d4307c24818fac20' => :mavericks
    sha1 '8c315d70c7c0a4e1cf6d5a1d659cbc439298b8db' => :mountain_lion
    sha1 '0840b3a0917b5617846a973c9c5ecdac9b8aaaae' => :lion
  end

  def install
    rm_f Dir['bin/*.bat']
    # Put the sonatype-work directory in the var directory, to persist across version updates
    inreplace "nexus-#{version}/conf/nexus.properties",
      'nexus-work=${bundleBasedir}/../sonatype-work/nexus',
      "nexus-work=#{var}/nexus"
    libexec.install Dir["nexus-#{version}/*"]
    bin.install_symlink libexec/'bin/nexus'
  end

  plist_options :manual => "#{HOMEBREW_PREFIX}/opt/nexus/libexec/bin/nexus start"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>com.sonatype.nexus</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_prefix}/bin/nexus</string>
          <string>start</string>
        </array>
        <key>RunAtLoad</key>
      <true/>
      </dict>
    </plist>
    EOS
  end
end
