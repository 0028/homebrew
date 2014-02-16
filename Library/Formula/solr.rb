require 'formula'

class Solr < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'http://www.apache.org/dyn/closer.cgi?path=lucene/solr/4.6.1/solr-4.6.1.tgz'
  sha1 '7abae945f6829a5a0375c2f6b76c5d99b377c2db'

  bottle do
    sha1 "8d6e48e4392ddb2c7230d821057d78b4b4b405b1" => :mavericks
    sha1 "eb149fe7167c0e0952d3a7b4933dca7d2fce3c4d" => :mountain_lion
    sha1 "4dac32bbc5e8fce56ab0d0d8ce74560a4d3a98e9" => :lion
  end

  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr path/to/config/dir"
    else
      cd #{libexec}/example && java -server $JAVA_OPTS -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin+'solr').write script
  end

  def caveats; <<-EOS.undent
    To start solr:
      solr path/to/solr/config/dir

    See the solr homepage for more setup information:
      brew home solr
    EOS
  end
end
