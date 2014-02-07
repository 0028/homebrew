require 'formula'

class IrcdHybrid < Formula
  homepage 'http://www.ircd-hybrid.org/'
  url 'http://downloads.sourceforge.net/project/ircd-hybrid/ircd-hybrid/ircd-hybrid-8.1.13/ircd-hybrid-8.1.13.tgz'
  sha1 '5874cf6972333b4944cc218cd21918a2120e0304'

  bottle do
    sha1 "3e99298e8d386edb97cd9221238d3b0060d151d8" => :mavericks
    sha1 "13764ab80405e130a1049a9cf2fa25d4a6460009" => :mountain_lion
    sha1 "0fcca18fe9517b70e1f1e4bac6d3e9656f26a556" => :lion
  end

  # ircd-hybrid needs the .la files
  skip_clean :la

  # system openssl fails with undefined symbols: "_SSL_CTX_clear_options"
  depends_on 'openssl' if MacOS.version < :lion

  def install
    ENV.j1 # build system trips over itself

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--localstatedir=#{var}",
                          "--sysconfdir=#{etc}",
                          # there's no config setting for this so set it to something generous
                          "--with-nicklen=30"
    system "make install"
    etc.install "doc/reference.conf" => "ircd.conf"
  end

  def test
    system "#{sbin}/ircd", "-version"
  end

  def caveats; <<-EOS.undent
    You'll more than likely need to edit the default settings in the config file:
      #{etc}/ircd.conf
    EOS
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
