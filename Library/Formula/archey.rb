require 'formula'

class Archey < Formula
  homepage 'http://obihann.github.io/archey-osx/'
  url 'https://github.com/obihann/archey-osx/archive/1.3.tar.gz'
  sha1 '8fbc2a939d39bee1741af758d87cd54fb01472fa'

  bottle do
    cellar :any
    sha1 "114f20bf8a067dfc45434ccbc86a3c255503a6e3" => :mavericks
    sha1 "49450a7ee7d3f791a5af14e9014a08bbcd9babd0" => :mountain_lion
    sha1 "cfecf5c5590d5eed6bf173ec1682961103164a54" => :lion
  end

  def install
    bin.install 'bin/archey'
  end

  test do
    system "#{bin}/archey"
  end
end
