require 'formula'

class Geoserver < Formula
  homepage 'http://geoserver.org/'
  url 'http://downloads.sourceforge.net/project/geoserver/GeoServer/2.4.1/geoserver-2.4.1-bin.zip'
  sha1 '1f33e16c14bc0bceea1ffa74a0d528dd832de611'

  bottle do
    sha1 'b6bec00fcf1eb43d5024e17bfe542f5e113d060e' => :mavericks
    sha1 'a03edad934a6a2eb37b4288dbe457b7f6dc0abf4' => :mountain_lion
    sha1 'c88be7e12bc662026f1b01e8f73c6c1cd600d419' => :lion
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
