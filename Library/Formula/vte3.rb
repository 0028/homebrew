require 'formula'

class Vte3 < Formula
  homepage 'http://developer.gnome.org/vte/'
  url 'http://ftp.gnome.org/pub/gnome/sources/vte/0.32/vte-0.32.2.tar.xz'
  sha1 'a58569a99ac06a240bdda3ec7353f2626145852d'

  bottle do
    sha1 "3737c55a596732b9c253b61c356979b2a1fed7df" => :mavericks
    sha1 "4812e128aaf8efcbabd83d69e7345e0371f50b4f" => :mountain_lion
    sha1 "443c0b24b8dc4ca5b883e3d45413990c692aebbc" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'gtk+3'
  depends_on 'pygtk'
  depends_on :python => :recommended
  depends_on 'gobject-introspection'

  def install
    args = [
      "--disable-dependency-tracking",
      "--prefix=#{prefix}",
      "--disable-Bsymbolic",
      "--enable-introspection=yes",
    ]

    if build.with? "python"
      # pygtk-codegen-2.0 has been deprecated and replaced by
      # pygobject-codegen-2.0, but the vte Makefile does not detect this.
      ENV["PYGTK_CODEGEN"] = Formula["pygobject"].bin/'pygobject-codegen-2.0'
      args << "--enable-python"
    end

    system "./configure", *args
    system "make install"
  end
end
