require 'formula'

class OsmPbf < Formula
  homepage 'http://wiki.openstreetmap.org/wiki/PBF_Format'
  url 'https://github.com/scrosby/OSM-binary/archive/v1.3.3.tar.gz'
  sha1 '639e3eecc00041e6326b69da6c200fabe7ad2895'

  bottle do
    cellar :any
    sha1 "38c4ce5a81b79779b1d03bb8ecde1d3944299bb2" => :mavericks
    sha1 "0a86a3694de2e3ec46c82b5ceabb29143db84c05" => :mountain_lion
    sha1 "181c21d60ce34fead9e52b2e8bc27ebdff6fd9bb" => :lion
  end

  depends_on 'protobuf'

  def install
    cd 'src' do
      system "make"
      lib.install 'libosmpbf.a'
    end
    include.install Dir['include/*']
  end
end
