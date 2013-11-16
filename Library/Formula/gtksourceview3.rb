require 'formula'

class Gtksourceview3 < Formula
  homepage 'http://projects.gnome.org/gtksourceview/'
  url 'http://ftp.acc.umu.se/pub/gnome/sources/gtksourceview/3.10/gtksourceview-3.10.0.tar.xz'
  sha1 '96136aa8b0f133e49269d4c71341fceff32898f7'
  bottle do
    sha1 'a0bb9b068c4eb1acc5c9f0abadad5c051c389500' => :mavericks
    sha1 '799e193369933554ff7279a41a905fd1b51d6040' => :mountain_lion
    sha1 'f4239f132a7e1b8c077b73af7ee3638a0a2e0d31' => :lion
  end

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'gtk+3'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
