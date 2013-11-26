require 'formula'

class Rethinkdb < Formula
  homepage 'http://www.rethinkdb.com/'
  url 'http://download.rethinkdb.com/dist/rethinkdb-1.11.0.tgz'
  sha1 '9a56bc07b7ed431432ee2be61dc6aafa49fc3760'

  bottle do
    sha1 '548325de4adcfcbed04b654c460c35b7726a4d14' => :mavericks
    sha1 '8c9069d476a9dac4d0c02456d88e252fd24a5063' => :mountain_lion
    sha1 'dafe3a5e0122c6ccfd8f54b12e0209fc8d07d00f' => :lion
  end

  depends_on :macos => :lion
  depends_on 'boost' => :build
  depends_on 'protobuf' if MacOS.version >= :mavericks

  fails_with :gcc do
    build 5666 # GCC 4.2.1
    cause 'RethinkDB uses C++0x'
  end

  def install
    args = ["--prefix=#{prefix}", "--fetch", "v8"]
    args += ["--fetch", "protobuf"] unless MacOS.version >= :mavericks
    system "./configure", *args
    system "make"
    system "make install-osx"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
          <string>#{opt_prefix}/bin/rethinkdb</string>
          <string>-d</string>
          <string>#{var}/rethinkdb</string>
      </array>
      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/rethinkdb/rethinkdb.log</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/rethinkdb/rethinkdb.log</string>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
    </dict>
    </plist>
    EOS
  end
end
