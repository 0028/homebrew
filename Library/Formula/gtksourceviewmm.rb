require 'formula'

class Gtksourceviewmm < Formula
  homepage 'https://developer.gnome.org/gtksourceviewmm/'
  url 'http://ftp.gnome.org/pub/GNOME/sources/gtksourceviewmm/2.10/gtksourceviewmm-2.10.3.tar.xz'
  sha1 '17d5daf33d2b6bc21c48c5c730abaae70e027566'

  bottle do
    sha1 '3f6336c3b8d70de3eeb133bb95b4bf22354f9cdc' => :mavericks
    sha1 '79740ce22dc16a829f8097a092d1384d3824257c' => :mountain_lion
    sha1 '26f8062cb93ca88059f6e0b1b6afd543b6703f42' => :lion
  end

  depends_on 'gtksourceview'
  depends_on 'xz' => :build
  depends_on 'pkg-config' => :build
  depends_on 'gtkmm'
  depends_on :x11

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
