require 'formula'

class RubyInstall < Formula
  homepage 'https://github.com/postmodern/ruby-install#readme'
  url 'https://github.com/postmodern/ruby-install/archive/v0.3.4.tar.gz'
  sha1 '76b1df95cb056cfe432499a780f6a12ce908b159'

  head 'https://github.com/postmodern/ruby-install.git'

  bottle do
    cellar :any
    sha1 '978324f195e579ec3bbdc8ce6861a9f1811bc0b1' => :mavericks
    sha1 '8891c9444f73206f0b1d77df947f0dab04e6ee5e' => :mountain_lion
    sha1 'c80e66966d232a14bd57943b904bc3c9f3bcd765' => :lion
  end

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
