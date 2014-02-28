require 'formula'

class Solr < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'http://www.apache.org/dyn/closer.cgi?path=lucene/solr/4.7.0/solr-4.7.0.tgz'
  sha1 '5599a33f6d7c46251d87ff226709e759572ade4b'

  bottle do
    sha1 "e19ef67df64d23835f208486461e16fa01ece942" => :mavericks
    sha1 "572d6d4aacdf3ce1ef7419ad97fb79e2667d112e" => :mountain_lion
    sha1 "5620f224a64dae591333dcfaf4389943053f8961" => :lion
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
