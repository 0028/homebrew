require 'formula'

class Chromedriver < Formula
  homepage 'http://code.google.com/p/chromedriver/'
  url 'http://chromedriver.storage.googleapis.com/2.8/chromedriver_mac32.zip'
  sha1 'b44d4666d00531f9edc5f1e89534a789fb4ec162'
  version '2.8'

  bottle do
    cellar :any
    sha1 '6f3390eb4de2eff73d34d11934459e9894e5d60b' => :mavericks
    sha1 '1e98a27c30b4227d5142376a194f9ee3a0ef9bfb' => :mountain_lion
    sha1 'd3c6e972f2b44d9be552443b3168a1ec8d51d23f' => :lion
  end

  def install
    bin.install 'chromedriver'
  end
end
