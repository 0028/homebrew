require 'formula'

class Tika < Formula
  homepage 'http://tika.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=tika/tika-app-1.5.jar'
  sha1 '7f3657da1075bf95ac8faa2bafcba24228e6c714'

  bottle do
    sha1 "ddd3b2bbedb3c68bd306d0be7bd5ba41994247ad" => :mavericks
    sha1 "e642b58bf55fd855234e5caa3e95a871e2cfa773" => :mountain_lion
    sha1 "3e04f91a9b1c55a2ba7e3a1c2b202853132a0c25" => :lion
  end

  resource 'server' do
    url 'http://repo1.maven.org/maven2/org/apache/tika/tika-server/1.5/tika-server-1.5.jar'
    sha1 '4c0a659ca54d881ab187091169439cf0891a8154'
  end

  def install
    libexec.install "tika-app-#{version}.jar"
    bin.write_jar_script libexec/"tika-app-#{version}.jar", "tika"

    libexec.install resource('server')
    bin.write_jar_script libexec/"tika-server-#{version}.jar", "tika-rest-server"
  end

  def caveats; <<-EOS.undent
    To run Tika:
      tika

    To run Tika's REST server:
      tika-rest-server

    See the Tika homepage for more documentation:
      brew home tika
    EOS
  end
end
