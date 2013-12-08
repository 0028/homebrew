require 'formula'

class Isync < Formula
  homepage 'http://isync.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/isync/isync/1.0.6/isync-1.0.6.tar.gz'
  sha1 '5cd7403722584b9677fc6a4185c0b9a00f153453'

  bottle do
    cellar :any
    sha1 '86534d7069589b5538c805d044e1803f03901856' => :mavericks
    sha1 'd4c6c405a757b6dd35bdf275b23fb426c764b4d6' => :mountain_lion
    sha1 '1f971f92fbdebfd64d1afc67cd73731808ea5a84' => :lion
  end

  head do
    url 'git://git.code.sf.net/p/isync/isync'

    depends_on :autoconf
    depends_on :automake
  end

  depends_on 'berkeley-db'

  def install
    system "touch", "ChangeLog" if build.head?
    system "./autogen.sh" if build.head?

    system './configure', "--prefix=#{prefix}", '--disable-dependency-tracking'
    system "make install"
  end
end
