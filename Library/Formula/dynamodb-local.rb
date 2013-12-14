require 'formula'

class DynamodbLocal < Formula
  homepage 'https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html'
  url 'https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_2013-12-12.tar.gz'
  version '2013-12-12'
  sha1 '66e39e57297a394e7ca7b30d3072c615fd413310'

  bottle do
    sha1 '8b84b4d16fbbe8b772dffd961c7800534e3f33d3' => :mavericks
    sha1 '2002af146c2e3e23cbce6d10536ab90501a3bc4d' => :mountain_lion
    sha1 '1f97a6322863d8552b1aa8d2574dedc2f70e0c9a' => :lion
  end

  def data_path
    var/'data/dynamodb-local'
  end

  def log_path
    var/'log/dynamodb-local.log'
  end

  def bin_wrapper; <<-EOS.undent
    #!/bin/sh
    cd #{data_path} && java -Djava.library.path=#{libexec}/DynamodbLocal_lib -jar #{libexec}/DynamoDBLocal.jar
    EOS
  end

  def install
    prefix.install %w[LICENSE.txt README.txt third_party_licenses]
    libexec.install %w[DynamoDBLocal_lib DynamoDBLocal.jar]
    (bin/'dynamodb-local').write(bin_wrapper)
  end

  def post_install
    data_path.mkpath
  end

  def caveats; <<-EOS.undent
    DynamoDB Local supports the Java Runtime Engine (JRE) version 6.x or
    newer; it will not run on older JRE versions.

    In this release, the local database file format has changed;
    therefore, DynamoDB Local will not be able to read data files
    created by older releases.

    Data: #{data_path}
    Logs: #{log_path}
    EOS
  end

  plist_options :manual => "#{HOMEBREW_PREFIX}/bin/dynamodb-local"

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
      <false/>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/dynamodb-local</string>
      </array>
      <key>StandardErrorPath</key>
      <string>#{log_path}</string>
    </dict>
    </plist>
    EOS
  end
end
