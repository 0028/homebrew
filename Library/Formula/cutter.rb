require 'formula'

class Cutter < Formula
  homepage 'http://cutter.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/cutter/cutter/1.2.3/cutter-1.2.3.tar.gz'
  sha1 '97446319f0a4892433912ab91633b6e0ffa2d09c'

  bottle do
    sha1 "368ff243c89fb9baad05cce9f93fd5e0a396fd08" => :mavericks
    sha1 "6dcf31f6227d02022806e707ca860f28c14a9757" => :mountain_lion
    sha1 "b1b1460237d54e95dbaa70353bbd524e67a0d610" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'glib'
  depends_on 'gettext'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-glibtest",
                          "--disable-goffice",
                          "--disable-gstreamer",
                          "--disable-libsoup"
    system "make"
    system "make install"
  end
end
