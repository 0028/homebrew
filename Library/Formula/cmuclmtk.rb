require 'formula'

class Cmuclmtk < Formula
  homepage 'http://cmusphinx.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/cmusphinx/cmuclmtk/0.7/cmuclmtk-0.7.tar.gz'
  sha1 '118a2d10f7ac12582b08d9d9e7d970e13247b831'

  bottle do
    cellar :any
    sha1 '4b42398807a0744248428e70b33bf87dbfe3948e' => :mavericks
    sha1 '088c01268c190856f3bb00ff9d8357aaa6aeb7e9' => :mountain_lion
    sha1 'a0dc0834aa5a2be01bd7ba133fb80d5c1b0e0b58' => :lion
  end

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
