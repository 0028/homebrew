require 'formula'

class Geoserver < Formula
  homepage 'http://geoserver.org/'
  url 'https://downloads.sourceforge.net/project/geoserver/GeoServer/2.5/geoserver-2.5-bin.zip'
  sha1 '7e13257cf158b5a349220a20b37e4c3d2f5153b4'

  bottle do
    cellar :any
    sha1 "7771b8c6b4832720b5f6ffd99dd8290bb14bfa00" => :mavericks
    sha1 "117fd72235e8c5f3893c6d0b4a7fa6ace66c394c" => :mountain_lion
    sha1 "521d18c4d81e0836d9fc325d7dec7768c25fb77a" => :lion
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
