require 'formula'

class Dialog < Formula
  homepage 'http://invisible-island.net/dialog/'
  url 'ftp://invisible-island.net/dialog/dialog-1.2-20130928.tgz'
  sha1 '204d852856754817f5590f60ffaa1c07a8ed35ca'

  bottle do
    cellar :any
    sha1 'aa68785155668e5b8a13e779b6dc8d08ab09c920' => :mavericks
    sha1 'a33ea22d17a85151fb965a85e3ab82496dae69b2' => :mountain_lion
    sha1 '6802fb21887ffb33738372371f83f094978ca298' => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--mandir=#{man}"
    system "make install"
  end
end
