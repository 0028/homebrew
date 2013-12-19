require 'formula'

class Memcached < Formula
  homepage 'http://memcached.org/'
  url 'http://www.memcached.org/files/memcached-1.4.16.tar.gz'
  sha1 'fdf071b5fd9972bf74f91d43f0b4cba980b83acb'

  bottle do
    sha1 '97e89226b74dbebf6aa3bdc717d8b54f93a41638' => :mavericks
    sha1 'f26b40edd5f8a584c30c0547473049b83751a87f' => :mountain_lion
    sha1 '7b403d8db3769f346d7d821e15cf2827c665850d' => :lion
  end

  depends_on 'libevent'

  option "enable-sasl", "Enable SASL support -- disables ASCII protocol!"
  option "enable-sasl-pwdb", "Enable SASL with memcached's own plain text password db support -- disables ASCII protocol!"

  conflicts_with 'mysql-cluster', :because => 'both install `bin/memcached`'

  def install
    args = ["--prefix=#{prefix}", "--disable-coverage"]
    args << "--enable-sasl" if build.include? "enable-sasl"
    args << "--enable-sasl-pwdb" if build.include? "enable-sasl-pwdb"

    system "./configure", *args
    system "make install"
  end

  plist_options :manual => "#{HOMEBREW_PREFIX}/opt/memcached/bin/memcached"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>KeepAlive</key>
      <true/>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_prefix}/bin/memcached</string>
        <string>-l</string>
        <string>localhost</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>
    </dict>
    </plist>
    EOS
  end
end
