require 'formula'

class Geoserver < Formula
  homepage 'http://geoserver.org/'
  url 'http://downloads.sourceforge.net/project/geoserver/GeoServer/2.4.1/geoserver-2.4.1-bin.zip'
  sha1 '1f33e16c14bc0bceea1ffa74a0d528dd832de611'

  bottle do
    sha1 'e75e428a6a448ab40667f33112a4af34dac8e98d' => :mavericks
    sha1 '16d37375286f6c1a3077e0372d2f6f5c190e2567' => :mountain_lion
    sha1 '6e3ffeefbc51fc3a59b57cc726cdaebb5c5a4607' => :lion
  end

  def install
    libexec.install Dir['*']
    (bin/'geoserver').write <<-EOS.undent
      #!/bin/sh
      if [ -z "$1" ]; then
        echo "Usage: $ geoserver path/to/data/dir"
      else
        cd "#{libexec}" && java -DGEOSERVER_DATA_DIR=$1 -jar start.jar
      fi
    EOS
  end

  def caveats; <<-EOS.undent
    To start geoserver:
      geoserver path/to/data/dir

    See the Geoserver homepage for more setup information:
      brew home geoserver
    EOS
  end
end
