require 'formula'

class Pidgin < Formula
  homepage 'http://pidgin.im/'
  url 'https://downloads.sourceforge.net/project/pidgin/Pidgin/2.10.9/pidgin-2.10.9.tar.bz2'
  sha1 'f3de8fd94dba1f4c98d5402a02430f9f323e665a'
  bottle do
    sha1 "e8cb985e74dd8e596518906b0930c7358297faec" => :mavericks
    sha1 "c1532e9ca452c54c07e9e3893019488f38839f65" => :mountain_lion
    sha1 "a6f818534c770c8bb8e77382bda49f6d2949d70d" => :lion
  end

  revision 1

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'gnutls'
  depends_on 'gtk+'

  option 'perl', 'Build pidgin with perl support'

  def install
    args = %W[
      --disable-debug
      --prefix=#{prefix}
      --disable-avahi
      --disable-dbus
      --disable-gevolution
      --disable-gstreamer
      --disable-gstreamer-interfaces
      --disable-gtkspell
      --disable-idn
      --disable-meanwhile
      --disable-vv
      --enable-gnutls=yes
    ]

    args << '--disable-perl' unless build.include? 'perl'

    system "./configure", *args
    system "make install"
  end

  test do
    system "#{bin}/pidgin --version"
  end
end
