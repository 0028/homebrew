require 'formula'

class Solr < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'http://www.apache.org/dyn/closer.cgi?path=lucene/solr/4.6.0/solr-4.6.0.tgz'
  sha1 'b1380e1b4b23b1e11aecf7c66c56e834ea7ff24e'

  bottle do
    sha1 'a532d4194cca019136c47f06e54b92608b10ae73' => :mavericks
    sha1 '362fde7d3df610eecd3c78e3ebcd8ce7111cd4a6' => :mountain_lion
    sha1 '4ef25e208b516939dd57479a3d56912c7fa8ff5b' => :lion
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
