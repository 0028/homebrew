require 'formula'

class Colormake < Formula
  #homepage 'http://bre.klaki.net/programs/colormake/' # kept as reminder of tarball homepage
  homepage 'https://github.com/pagekite/Colormake'
  url 'http://bre.klaki.net/programs/colormake/colormake-0.9.tar.gz'
  sha1 '6c5ab4be23d60ec79ed4c43cbeb142bfd4a4e626'
  head 'https://github.com/pagekite/Colormake.git'

  bottle do
    cellar :any
    sha1 "36d24e3b88b637b2932ec3f72b22fe02fd27a9a7" => :mavericks
    sha1 "973590954b49aec68a67393429bd3856124c86c6" => :mountain_lion
    sha1 "4d89eee21e23673cc00523d65cfb309241b143d2" => :lion
  end

  def install
    inreplace "colormake", "colormake.pl", "#{libexec}/colormake.pl"

    # Prefers symlinks than the original duplicate files
    File.unlink 'colormake-short', 'clmake', 'clmake-short'
    File.symlink 'colormake', 'colormake-short'
    File.symlink 'colormake', 'clmake'
    File.symlink 'colormake', 'clmake-short'

    # Adds missing clmake.1 referenced in colormake.1 itself
    File.symlink 'colormake.1', 'clmake.1'

    # Installs auxiliary script, commands and mans
    libexec.install 'colormake.pl'
    bin.install 'colormake', 'clmake', 'colormake-short', 'clmake-short'
    man.mkpath
    man1.install 'colormake.1', 'clmake.1'
  end
end
