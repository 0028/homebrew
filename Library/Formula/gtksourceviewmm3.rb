require 'formula'

class Gtksourceviewmm3 < Formula
  homepage 'https://developer.gnome.org/gtksourceviewmm/'
  url 'http://ftp.gnome.org/pub/GNOME/sources/gtksourceviewmm/3.2/gtksourceviewmm-3.2.0.tar.xz'
  sha1 'cac8d2fdde7b862bdb5eb12c6b8998a29e3fcf95'

  bottle do
    sha1 '888b2055df5f30423c7060d4cbbb3ea6f6e497a9' => :mavericks
    sha1 '06312c13ff8180d7528a94df1b7093ff33dd199c' => :mountain_lion
    sha1 'a1a34756b23560985a5b62be4d3b5dbf0fdf6c36' => :lion
  end

  depends_on 'gtksourceview3'
  depends_on 'xz' => :build
  depends_on 'pkg-config' => :build
  depends_on 'gtkmm3'
  depends_on :x11

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
