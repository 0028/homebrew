require 'formula'

class Finch < Formula
  homepage 'http://developer.pidgin.im/wiki/Using%20Finch'
  url 'https://downloads.sourceforge.net/project/pidgin/Pidgin/2.10.9/pidgin-2.10.9.tar.bz2'
  sha1 'f3de8fd94dba1f4c98d5402a02430f9f323e665a'
  bottle do
    sha1 "efe612ec4cc0516934ab6d584cfcb93e1658c70e" => :mavericks
    sha1 "964f644c6a1f9918de2d988978c397cb2582e3ec" => :mountain_lion
    sha1 "b2338ab253d46054874d3b7e432114d988d41ef1" => :lion
  end

  revision 1

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'gnutls'
  depends_on 'libidn'

  option 'purple', 'Only build libpurple'
  option 'perl', 'Build libpurple with perl support'

  def install
    # Common options
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
      --disable-avahi
      --disable-dbus
      --disable-doxygen
      --disable-gstreamer
      --disable-gtkui
      --disable-meanwhile
      --disable-vv
      --without-x
    ]

    args << '--disable-perl' unless build.include? 'perl'

    if build.include? 'purple'
      args << '--disable-consoleui'
    end

    system "./configure", *args
    system "make install"
  end
end
