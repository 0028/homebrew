require 'formula'

class GtkMurrineEngine < Formula
  homepage 'https://github.com/GNOME/murrine'
  url 'http://ftp.gnome.org/pub/GNOME/sources/murrine/0.98/murrine-0.98.2.tar.xz'
  sha1 'ddaca56b6e10736838572014ae9d20b814242615'

  bottle do
    cellar :any
    sha1 '98470793bed16e6bcab8fbc719853d606d418659' => :mavericks
    sha1 'b5add8aee8dd8e017423784c6ed230ffb4be8526' => :mountain_lion
    sha1 'a7d205ede509f8ec3633656213cab95dc7e43699' => :lion
  end

  depends_on 'intltool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'gtk+'
  depends_on 'gettext'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-animation"
    system "make", "install"
  end
end
