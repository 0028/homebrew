require 'formula'

class Tor < Formula
  homepage 'https://www.torproject.org/'
  url 'https://www.torproject.org/dist/tor-0.2.4.19.tar.gz'
  sha1 'f0050921016d63c426f0c61dbaa8ced50a36474b'

  bottle do
    sha1 'a4ff3b20c8e7da3835d8ec0e2b71dcce731b4c3b' => :mavericks
    sha1 '58cfe8df5e653c699096a7b04b17d2b1bc614b00' => :mountain_lion
    sha1 '8a4622eecb3ed24f2e1c55b0305eea1a7bc90f9e' => :lion
  end

  devel do
    url 'https://www.torproject.org/dist/tor-0.2.5.1-alpha.tar.gz'
    version '0.2.5.1-alpha'
    sha1 'd10cb78e6a41657d970a1ce42105142bcfc315fb'
  end

  option "with-brewed-openssl", "Build with Homebrew's OpenSSL instead of the system version"

  depends_on 'libevent'
  depends_on 'openssl' if build.with? 'brewed-openssl'

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    args << "-with-ssl=#{Formulary.factory('openssl').opt_prefix}" if build.with? 'brewed-openssl'

    system "./configure", *args
    system "make install"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ProgramArguments</key>
        <array>
            <string>#{opt_prefix}/bin/tor</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
