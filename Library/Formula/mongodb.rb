require 'formula'

class Mongodb < Formula
  homepage 'http://www.mongodb.org/'
  url 'http://downloads.mongodb.org/src/mongodb-src-r2.4.9.tar.gz'
  sha1 '3aa495cf32769a09ee9532827391892d96337d6b'

  bottle do
    sha1 '04d49071102d86ac06f35ed9e4c855a677d97c68' => :mavericks
    sha1 '2ee3ed1b44777ea740da87b952acdadf19084bd4' => :mountain_lion
    sha1 'b4898545634c7015093036c260dca69bc96fa5b8' => :lion
  end

  # Note: when 2.6 is released, the option can be defined outside the
  # stable/devel/head blocks and this helper function removed.
  def self.add_with_boost_option spec
    spec.option "with-boost", "Compile using installed boost, not the version shipped with mongodb"
    spec.depends_on "boost" => :optional
  end

  stable do
    url 'http://downloads.mongodb.org/src/mongodb-src-r2.4.9.tar.gz'
    sha1 '3aa495cf32769a09ee9532827391892d96337d6b'

    # On Mavericks, allow --with-boost only for --devel and --HEAD, since boost
    # is built with libc++ and current stable (2.4) can't be built with libc++
    if MacOS.version < :mavericks
      Mongodb.add_with_boost_option self
    end
  end

  devel do
    url 'http://downloads.mongodb.org/src/mongodb-src-r2.5.5.tar.gz'
    sha1 '4827f3da107174a3cbb1f5b969c7f597ca09b4f8'
    Mongodb.add_with_boost_option self
  end

  head do
    url 'https://github.com/mongodb/mongo.git'
    Mongodb.add_with_boost_option self
  end

  def patches
    if build.stable?
      [
        # Fix Clang v8 build failure from build warnings and -Werror
        'https://github.com/mongodb/mongo/commit/be4bc7.patch'
      ]
    end
  end

  depends_on 'scons' => :build
  depends_on 'openssl' => :optional

  def install

    args = ["--prefix=#{prefix}", "-j#{ENV.make_jobs}"]

    # Note: when 2.6 is released, cxx_suffix hack can be removed
    # ENV.append "CXXFLAGS", "-stdlib=libstdc++" does not seem to work with scons,
    # so use this hack of appending the flag to the --cxx parameter of the sconscript.
    cxx_suffix = ''
    if ENV.compiler == :clang && MacOS.version >= :mavericks
      if build.stable?
        # mongodb 2.4 can't build with libc++, but defaults to it on Mavericks
        cxx_suffix = ' -stdlib=libstdc++'
      else
        # build devel and HEAD version on Mavericks with libc++
        # Use --osx-version-min=10.9 such that the compiler defaults to libc++.
        # Upstream issue discussing the default flags:
        # https://jira.mongodb.org/browse/SERVER-12682
        args << "--osx-version-min=10.9"
      end
    end

    args << '--64' if MacOS.prefer_64_bit?
    args << "--cc=#{ENV.cc}"
    args << "--cxx=#{ENV.cxx}" + cxx_suffix

    # --full installs development headers and client library, not just binaries
    args << "--full"

    args << "--use-system-boost" if build.with? "boost"

    if build.with? 'openssl'
      args << '--ssl'
      args << "--extrapathdyn=#{Formula.factory('openssl').opt_prefix}"
    end

    scons 'install', *args

    (prefix+'mongod.conf').write mongodb_conf

    mv bin/'mongod', prefix
    (bin/'mongod').write <<-EOS.undent
      #!/usr/bin/env ruby
      ARGV << '--config' << '#{etc}/mongod.conf' unless ARGV.find { |arg|
        arg =~ /^\s*\-\-config$/ or arg =~ /^\s*\-f$/
      }
      exec "#{prefix}/mongod", *ARGV
    EOS

    etc.install prefix+'mongod.conf'

    (var+'mongodb').mkpath
    (var+'log/mongodb').mkpath
  end

  def mongodb_conf; <<-EOS.undent
    # Store data in #{var}/mongodb instead of the default /data/db
    dbpath = #{var}/mongodb

    # Append logs to #{var}/log/mongodb/mongo.log
    logpath = #{var}/log/mongodb/mongo.log
    logappend = true

    # Only accept local connections
    bind_ip = 127.0.0.1
    EOS
  end

  plist_options :manual => "mongod"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_prefix}/mongod</string>
        <string>run</string>
        <string>--config</string>
        <string>#{etc}/mongod.conf</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <false/>
      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/mongodb/output.log</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/mongodb/output.log</string>
      <key>HardResourceLimits</key>
      <dict>
        <key>NumberOfFiles</key>
        <integer>1024</integer>
      </dict>
      <key>SoftResourceLimits</key>
      <dict>
        <key>NumberOfFiles</key>
        <integer>1024</integer>
      </dict>
    </dict>
    </plist>
    EOS
  end
end
