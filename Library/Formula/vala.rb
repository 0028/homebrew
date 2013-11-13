require 'formula'

class Vala < Formula
  homepage 'http://live.gnome.org/Vala'
  url 'http://ftp.gnome.org/pub/gnome/sources/vala/0.22/vala-0.22.1.tar.xz'
  sha1 '440b63356a94565a3f58b9e2218e3bb31f02879b'

  head 'git://git.gnome.org/vala'

  bottle do
    sha1 'b18de843e919fab80c1ce5c0267f2b61cce3a7ac' => :mavericks
    sha1 'c59585ce06bb78bbb1ff4d2b19497d5710c11d70' => :mountain_lion
    sha1 'b46b23508081d7d7d1add6cb4a32296d1356b309' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
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
