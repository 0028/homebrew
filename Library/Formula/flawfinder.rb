require 'formula'

class Flawfinder < Formula
  homepage 'http://www.dwheeler.com/flawfinder/'
  url 'http://www.dwheeler.com/flawfinder/flawfinder-1.27.tar.gz'
  sha1 '0af702c1e0cbd0385a78be6ef1f2f7752ba6193f'
  head 'git://git.code.sf.net/p/flawfinder/code'

  bottle do
    cellar :any
    sha1 '82f0335e610031b62256738370e4ba6e03155ad5' => :mavericks
    sha1 'b9579e5f68845663d954232fd9f978971870ed1e' => :mountain_lion
    sha1 'b4e7400b23ea3ba4710a9c55340085cb9c1d5665' => :lion
  end

  def install
    system "make", "INSTALL_DIR=#{prefix}",
                   "INSTALL_DIR_BIN=#{bin}",
                   "INSTALL_DIR_MAN=#{man1}",
                   "install"
  end
end
