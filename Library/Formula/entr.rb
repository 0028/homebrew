require 'formula'

class Entr < Formula
  homepage 'http://entrproject.org/'
  url 'http://entrproject.org/code/entr-2.6.tar.gz'
  sha1 'ad0fed4e0311c72b4c2eb70c93b7d1267bd4de4c'

  bottle do
    cellar :any
    sha1 "31c3dc8487ff67a6553842871b3a528dced1eaec" => :mavericks
    sha1 "0ee05e7fcb19a169b4caa4f04a33612bdf63f75d" => :mountain_lion
    sha1 "498b45344c119045d2788a49a1584d1c99e24731" => :lion
  end

  def install
    ENV['PREFIX'] = prefix
    ENV['MANPREFIX'] = man
    system "./configure"
    system "make"
    system "make install"
  end
end
