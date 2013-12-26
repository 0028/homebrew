require 'formula'

class Tnef < Formula
  homepage 'http://sourceforge.net/projects/tnef/'
  url 'http://downloads.sourceforge.net/project/tnef/tnef/tnef-1.4.10.tar.gz'
  sha1 'c765d3d197f051f46fbe004e1ec9065f69734366'

  bottle do
    cellar :any
    sha1 '37138406ce65f134bf50d1bf27a25b6b4545ec76' => :mavericks
    sha1 '8339a81d6c91138059f49336915108213a0dd377' => :mountain_lion
    sha1 '30e851574b0590fe685609ec740365f98e349cd2' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
