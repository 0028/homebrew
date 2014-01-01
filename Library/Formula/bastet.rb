require 'formula'

class Bastet < Formula
  homepage 'http://fph.altervista.org/prog/bastet.html'
  url 'http://fph.altervista.org/prog/files/bastet-0.41.tgz'
  sha1 '644a0f76adedef84946159520c1639ff0c6c47ec'

  bottle do
    cellar :any
    sha1 'c4d24d86a434424a7c07e10ebc32785a78e30d02' => :mavericks
    sha1 'e44818550d05e96aef8ed15b0dd91da82009cf54' => :mountain_lion
    sha1 '17e8db5b9f02f39ce8e3ae8b23fb575388dee73b' => :lion
  end

  def patches
    # allows bastet to work on OS X
    'http://fph.altervista.org/prog/files/bastet-0.41-osx-patch.diff'
  end

  def install
    inreplace "Makefile", "BIN_PREFIX=/usr/bin/", "BIN_PREFIX=#{bin}/"
    inreplace "Makefile", "DATA_PREFIX=/var/games/", "DATA_PREFIX=#{var}/"
    inreplace "Makefile", "GAME_USER=games", "GAME_USER=`whoami`"
    system "make", "all"

    # for some reason, these aren't created automatically
    bin.mkpath
    var.mkpath
    man6.mkpath

    system "make", "install"

    # the makefile doesn't install the manpage
    man6.install 'bastet.6'
  end

  test do
    system "true" # since bastet doesn't provide any options, there is no way to perform a non-blocking test.
  end
end
