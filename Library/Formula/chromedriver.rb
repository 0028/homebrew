require 'formula'

class Chromedriver < Formula
  homepage 'http://code.google.com/p/chromedriver/'
  url 'http://chromedriver.storage.googleapis.com/2.7/chromedriver_mac32.zip'
  sha1 '5791a391b41e735fca0711314607e4de98aaf2dd'
  version '2.7'

  bottle do
    cellar :any
    sha1 '3b9c6effc51e83a4a8fb1cea30c6bff2c07b1005' => :mavericks
    sha1 '3a993b2ef93a69cfec0db0da785391b4e998ea20' => :mountain_lion
    sha1 'e6e1d0a4eeaa81c4b93e86a416f8766c99362e78' => :lion
  end

  def install
    bin.install 'chromedriver'
  end
end
