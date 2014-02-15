require 'formula'

class Finch < Formula
  homepage 'http://developer.pidgin.im/wiki/Using%20Finch'
  url 'http://downloads.sourceforge.net/project/pidgin/Pidgin/2.10.9/pidgin-2.10.9.tar.bz2'
  sha1 'f3de8fd94dba1f4c98d5402a02430f9f323e665a'

  bottle do
    sha1 "173f5f6bfe61978404824a7bc713f68ce65f6ac9" => :mavericks
    sha1 "49afcc1eb9720a18e0c074ebd4e785125d8efa14" => :mountain_lion
    sha1 "b08ac72c895c4715d345e7f583f9c478bcd7ba66" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'gnutls'
  depends_on 'libidn'

  option 'purple' 'Only build libpurple'
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
