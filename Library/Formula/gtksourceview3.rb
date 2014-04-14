require 'formula'

class Gtksourceview3 < Formula
  homepage 'http://projects.gnome.org/gtksourceview/'
  url 'http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.12/gtksourceview-3.12.0.tar.xz'
  sha1 'e2c65ba0c49624a22045ac7ada78136e4107e889'

  bottle do
    sha1 "9991f2060800ed0483a32ec9357c8f83db1c7793" => :mavericks
    sha1 "36cbca28356c9f09f52dd5961ded942b37c8a8a0" => :mountain_lion
    sha1 "9105c3473b5cdf56b934825eaf04cdd1b53452a0" => :lion
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
