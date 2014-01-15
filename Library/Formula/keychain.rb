require 'formula'

class Keychain < Formula
  homepage 'http://www.funtoo.org/wiki/Keychain'
  url 'https://github.com/funtoo/keychain.git',
    :revision => '7bca870a1f920820adf0e4fa319b30b7e4985ed3'
  version '2.7.1'
  head 'https://github.com/funtoo/keychain.git'

  bottle do
    cellar :any
    sha1 '9debb9a273f3bfa13fbff17e71336fa6ca272297' => :mavericks
    sha1 'c33453cc833ea9f143b8fa355aac7d0728ce123b' => :mountain_lion
    sha1 '96f9c89ee390e4e16032676c1b7a5b5c58ed4af8' => :lion
  end

  def install
    system 'make'
    bin.install 'keychain'
    man1.install 'keychain.1'
  end
end
