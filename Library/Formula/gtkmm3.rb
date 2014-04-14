require 'formula'

class Gtkmm3 < Formula
  homepage 'http://www.gtkmm.org/'
  url 'http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.12/gtkmm-3.12.0.tar.xz'
  sha256 '86c526ceec15d889996822128d566748bb36f70cf5a2c270530dfc546a2574e1'

  bottle do
    sha1 "548febf8e9fb0790c955d5d760af2a8e8e99ac1d" => :mavericks
    sha1 "1a53d77fda759d9bcf0bff50091494a6fe25d4b2" => :mountain_lion
    sha1 "3a2db3ac8f1804e223d5df0e6becdb9734bf13e6" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'glibmm'
  depends_on 'gtk+3'
  depends_on 'libsigc++'
  depends_on 'pangomm'
  depends_on 'atkmm'
  depends_on 'cairomm'
  depends_on :x11

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
