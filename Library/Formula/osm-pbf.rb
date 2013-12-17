require 'formula'

class OsmPbf < Formula
  homepage 'http://wiki.openstreetmap.org/wiki/PBF_Format'
  url 'https://github.com/scrosby/OSM-binary/archive/v1.3.1.tar.gz'
  sha1 '4713e693dee3da42178764c8cb9b08188eb47a0d'

  bottle do
    cellar :any
    sha1 '8711e26c6895b557218928b098ad3200ef98fb5b' => :mavericks
    sha1 '8e0e1f43e30832507c2d7c1edb166ee77e5de706' => :mountain_lion
    sha1 '63365af07a82c6c4e45bcad1396a67cc812ea06f' => :lion
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
