require 'formula'

class Lpc21isp < Formula
  homepage 'http://lpc21isp.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/lpc21isp/lpc21isp/1.97/lpc21isp_197.tar.gz'
  sha1 '7e83c13889d56c20ab1a807975f212eac3bfdfd1'
  version '1.97'

  bottle do
    cellar :any
    sha1 "c0506230cc80b3b467a50edb0f3792f63f82a8e6" => :mavericks
    sha1 "86085b897d89ccb94495f57cd50aaf8a88ba3ab1" => :mountain_lion
    sha1 "fb6558c5b70a545b5ae22f6e59580dbee76b275e" => :lion
  end

  def install
    system "make"
    bin.install ["lpc21isp"]
  end
end
