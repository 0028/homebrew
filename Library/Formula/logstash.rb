require 'formula'

class Logstash < Formula
  homepage 'http://logstash.net/'
  url 'https://download.elasticsearch.org/logstash/logstash/logstash-1.3.2-flatjar.jar'
  sha1 'd49d48e0a9590eccb3b8acaa368c01f18125f33d'

  bottle do
    sha1 '221ea5f433ccc622a2f4e38a92b01fc65e2f017f' => :mavericks
    sha1 '8bfa446c7225dcd8574687d51d6ca37c8af658aa' => :mountain_lion
    sha1 'aab144193757a5288cbfa4e6e0916d30d2ca44fa' => :lion
  end

  def install
    libexec.install "logstash-#{version}-flatjar.jar"
    bin.write_jar_script libexec/"logstash-#{version}-flatjar.jar", "logstash"
  end
end
