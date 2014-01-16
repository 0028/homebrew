require 'formula'

class Crunch < Formula
  homepage 'http://sourceforge.net/projects/crunch-wordlist'
  url 'http://sourceforge.net/projects/crunch-wordlist/files/crunch-wordlist/crunch-3.5.tgz'
  sha1 '9caa1727d81f178805815a63e8d72736b750210c'

  bottle do
    cellar :any
    sha1 '3f7ddbd50a46edbb0a37464dc26f2bfefcb95690' => :mavericks
    sha1 'e3e4bd9b3a75aaddf097b9acad47312ee012aa77' => :mountain_lion
    sha1 'f89322a26af20a070ca5fc9e3e8e669ce94cb8bf' => :lion
  end

  def install
    system "make", "CC=#{ENV.cc}", "LFS=-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"

    bin.install "crunch"
    man1.install "crunch.1"
    share.install Dir["*.lst"]
  end
end
