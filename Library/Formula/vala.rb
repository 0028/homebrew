require 'formula'

class Vala < Formula
  homepage 'http://live.gnome.org/Vala'
  url 'http://ftp.gnome.org/pub/gnome/sources/vala/0.23/vala-0.23.2.tar.xz'
  sha1 'dcd68492f14b9324d211695c3a310c9c2ba3d929'

  head 'git://git.gnome.org/vala'

  bottle do
    sha1 "f73501886e6d15bee4a767268d39ec7ecd573c82" => :mavericks
    sha1 "6d5240ded949e9b9760ff0f303381e8ccf1ea88c" => :mountain_lion
    sha1 "f9ab7c25ccc4b84382774d74335864ad68dda214" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'glib'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make" # Fails to compile as a single step
    system "make install"
  end

  def test
    system "#{bin}/valac", "--version"
  end
end
