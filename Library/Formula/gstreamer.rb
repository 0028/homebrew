require 'formula'

class Gstreamer < Formula
  homepage 'http://gstreamer.freedesktop.org/'
  url 'http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.2.3.tar.xz'
  bottle do
    sha1 "628f8e79fc64b8d4e747d783a127aff4301c6ec0" => :mavericks
    sha1 "a20494d33eafc7b3fede3a3b2622a8fe970f4e81" => :mountain_lion
    sha1 "415dd18f8ab19a1dc2ef1e5d403d9a4417e8007e" => :lion
  end

  mirror 'http://ftp.osuosl.org/pub/blfs/svn/g/gstreamer-1.2.3.tar.xz'
  sha256 '0f9a9817a384b3448c368c23345e5122435caef9c00f1c40d7b1953827b0d8eb'

  head do
    url 'git://anongit.freedesktop.org/gstreamer/gstreamer'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'pkg-config' => :build
  depends_on 'gobject-introspection' => :optional
  depends_on 'gettext'
  depends_on 'glib'

  def install
    ENV.append "CFLAGS", "-funroll-loops -fstrict-aliasing -fno-common"

    args = %W[
      --prefix=#{prefix}
      --disable-debug
      --disable-dependency-tracking
      --disable-gtk-doc
    ]

    if build.head?
      ENV.append "NOCONFIGURE", "yes"
      system "./autogen.sh"
    end

    # Look for plugins in HOMEBREW_PREFIX/lib/gstreamer-1.0 instead of
    # HOMEBREW_PREFIX/Cellar/gstreamer/1.0/lib/gstreamer-1.0, so we'll find
    # plugins installed by other packages without setting GST_PLUGIN_PATH in
    # the environment.
    inreplace "configure", 'PLUGINDIR="$full_var"',
      "PLUGINDIR=\"#{HOMEBREW_PREFIX}/lib/gstreamer-1.0\""

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
