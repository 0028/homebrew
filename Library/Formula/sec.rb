require 'formula'

class Sec < Formula
  homepage 'http://simple-evcorr.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/simple-evcorr/sec/2.7.5/sec-2.7.5.tar.gz'
  sha1 'ceb2d0c27096306d8605354de87cc39c0fecaa03'

  bottle do
    cellar :any
    sha1 'b0a654e22f42a6d6e9fdfb741f55c33e3c85722c' => :mavericks
    sha1 '9adbc0e626f56ddde6417885e88e40b7cb6c4c06' => :mountain_lion
    sha1 '5840c881dd305ea1323c18987e533a16f34bbddf' => :lion
  end

  def install
    bin.install 'sec'
    man1.install 'sec.man' => 'sec.1'
  end

  test do
    system "#{bin}/sec", "--version"
  end
end
