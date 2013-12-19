require 'formula'

class Xa < Formula
  homepage 'http://www.floodgap.com/retrotech/xa/'
  url 'http://www.floodgap.com/retrotech/xa/dists/xa-2.3.5.tar.gz'
  sha1 'd8f4564953adfcee69faacfa300b954875fabe21'

  bottle do
    cellar :any
    sha1 '9d030e7f4ae8d6e649767d0cc01aa9e3d894fdc6' => :mavericks
    sha1 '37e57bffcbb2c1aaf89b7049c39f264b2a3d76b7' => :mountain_lion
    sha1 '912927ff3ec02a1679707561197eab139b2c7366' => :lion
  end

  def install
    inreplace "src/xa.c", /\bgetline\b/, "xa_getline"

    system "make", "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "DESTDIR=#{prefix}",
                   "install"
  end
end
