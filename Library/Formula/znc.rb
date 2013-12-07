require 'formula'

class Znc < Formula
  homepage 'http://wiki.znc.in/ZNC'
  url 'http://znc.in/releases/znc-1.2.tar.gz'
  sha1 '69a05702d2db8329ed323e9f74408260ea82c0eb'

  bottle do
    sha1 '553f1e9c7c832500e303804b57710e3f6f80164a' => :mavericks
    sha1 '7238c60b89b0ed82a4410ba5f466478a21e340f4' => :mountain_lion
    sha1 'ed688a8487e20e0b33a272b63ea4d44e31a911c6' => :lion
  end

  head do
    url 'https://github.com/znc/znc.git'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  option 'enable-debug', "Compile ZNC with --enable-debug"

  depends_on 'pkg-config' => :build

  def install
    args = ["--prefix=#{prefix}"]
    args << "--enable-debug" if build.include? 'enable-debug'

    system "./autogen.sh" if build.head?
    system "./configure", *args
    system "make install"
  end

  plist_options :manual => "znc --foreground"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/znc</string>
          <string>--foreground</string>
        </array>
        <key>StandardErrorPath</key>
        <string>#{var}/log/znc.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/znc.log</string>
        <key>RunAtLoad</key>
        <true/>
        <key>StartInterval</key>
        <integer>300</integer>
      </dict>
    </plist>
    EOS
  end
end
