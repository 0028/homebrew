require 'formula'

class Duply < Formula
  homepage 'http://duply.net'
  url 'https://downloads.sourceforge.net/project/ftplicity/duply%20(simple%20duplicity)/1.7.x/duply_1.7.3.tgz'
  sha1 'f9111e1cfee4cd63a38ff153735d35ca3956aa21'

  bottle do
    cellar :any
    sha1 "3b66f043f2f42c6001077e39100a1c43f46f433a" => :mavericks
    sha1 "2b232690c83a8808408e572624d3af828f007e13" => :mountain_lion
    sha1 "3c3bfb27662a6581260a1d7f1e0ea369ddf47d6a" => :lion
  end

  depends_on 'duplicity'

  def install
    bin.install 'duply'
  end
end
