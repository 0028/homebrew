require 'formula'

class Mawk < Formula
  homepage 'http://invisible-island.net/mawk/mawk.html'
  url 'ftp://invisible-island.net/mawk/mawk-1.3.4-20131226.tgz'
  sha1 '5f7eb0d86e8984512facdec7c571110a6a1467b9'

  bottle do
    cellar :any
    sha1 "6dde839519b22aba17579d931cfe934f5a7190af" => :mavericks
    sha1 "e90a4cd1ffb9adb57c00bc999413889f473ed818" => :mountain_lion
    sha1 "e2b4f420acb88f6159368a7b67cb88c06e2988bd" => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-readline=/usr/lib",
                          "--mandir=#{man}"
    system "make install"
  end
end
