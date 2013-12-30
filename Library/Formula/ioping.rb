require 'formula'

class Ioping < Formula
  homepage 'http://code.google.com/p/ioping/'
  url 'https://ioping.googlecode.com/files/ioping-0.8.tar.gz'
  sha1 '7d4fe1414cdd5887c332426a8844e17eca5e5646'

  head 'http://ioping.googlecode.com/svn/trunk/'

  bottle do
    cellar :any
    sha1 '5a66fd2cabee34c816f06c0d506c89114b5cc4f9' => :mavericks
    sha1 '3c2aafd3d820cea97a4e4d91a4b3017e2340eadc' => :mountain_lion
    sha1 '888030bc681b64bba57e9e00da0554ed498952c2' => :lion
  end

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def test
    system "#{bin}/ioping", "-v"
  end
end
