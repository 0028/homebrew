require 'formula'

class Talloc < Formula
  homepage 'http://talloc.samba.org/'
  url 'http://www.samba.org/ftp/talloc/talloc-2.1.0.tar.gz'
  sha1 'd079597f3f02a7ca3716645728a8a46016a1dd7d'

  bottle do
    cellar :any
    sha1 "04f84baea93af024d37cb988bdc2d2e7078ca439" => :mavericks
    sha1 "81fea8e0f1ef55447146d03626ffd8a922554e5b" => :mountain_lion
    sha1 "73885a86a3825f2343385e5e92d4bdd8ffa02373" => :lion
  end

  conflicts_with 'samba', :because => 'both install `include/talloc.h`'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-rpath", "--without-gettext"
    system "make install"
  end
end
