require 'formula'

class IrcdIrc2 < Formula
  homepage 'http://www.irc.org/'
  url 'http://www.irc.org/ftp/irc/server/irc2.11.2p3.tgz'
  sha1 '1ab317daeac324cc3f10fe939588de04d52e47c5'
  version '2.11.2p3'

  bottle do
    sha1 "bc27bd7c34becc3d4deefece228d0d69cf628a46" => :mavericks
    sha1 "31e2cf0b22c4466d609a4baf756ceca7515d7423" => :mountain_lion
    sha1 "90276cdc57d6f9b2ff729ce7e16cddc2258109eb" => :lion
  end

  def default_ircd_conf
    <<-EOS.undent
      # M-Line
      M:irc.localhost::Darwin ircd default configuration::000A

      # A-Line
      A:This is Darwin's default ircd configurations:Please edit your /usr/local/etc/ircd.conf file:Contact <root@localhost> for questions::ExampleNet

      # Y-Lines
      Y:1:90::100:512000:5.5:100.100
      Y:2:90::300:512000:5.5:250.250

      # I-Line
      I:*:::0:1
      I:127.0.0.1/32:::0:1

      # P-Line
      P::::6667:
    EOS
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--localstatedir=#{var}",
                          "--sysconfdir=#{etc}",
                          "--mandir=#{man}",
                          "CFLAGS=-DRLIMIT_FDMAX=0"

    # The directory is something like `i686-apple-darwin13.0.2'
    system "make -C *`uname -r` install"

    Pathname("ircd.conf").write(default_ircd_conf)
    etc.install "ircd.conf"
  end

  def test
    system "#{sbin}/ircd", "-version"
  end

  plist_options :manual => "ircd"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <false/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_prefix}/sbin/ircd</string>
        <string>-t</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>
      <key>StandardErrorPath</key>
      <string>#{var}/ircd.log</string>
    </dict>
    </plist>
    EOS
  end
end
