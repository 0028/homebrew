require 'formula'

class Logstash < Formula
  homepage 'http://logstash.net/'
  url 'https://download.elasticsearch.org/logstash/logstash/logstash-1.3.3-flatjar.jar'
  sha1 '8effc7027093188b968fed37513ca647f96d6d8c'

  bottle do
    sha1 "49a1585c0fe7d84b7fcc8cc0177671f7b0e147f4" => :mavericks
    sha1 "87941281b87e1b32ea63a5be537693f553f2b509" => :mountain_lion
    sha1 "0d4869237680d1ce7b21d56b14bd142702542d14" => :lion
  end

  def install
    libexec.install "logstash-#{version}-flatjar.jar"
    bin.write_jar_script libexec/"logstash-#{version}-flatjar.jar", "logstash"
  end
end
