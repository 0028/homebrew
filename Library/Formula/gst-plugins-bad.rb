require 'formula'

class GstPluginsBad < Formula
  homepage 'http://gstreamer.freedesktop.org/'
  url 'http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.2.3.tar.xz'
  bottle do
    sha1 "bad013e42a20958be58248966e7d9633368c873c" => :mavericks
    sha1 "520309c03dac5713b0e1abcbbe945449d4eb1e5b" => :mountain_lion
    sha1 "9fa12910f5cf5e7c12841337cfe0dbec5891d314" => :lion
  end

  mirror 'http://ftp.osuosl.org/pub/blfs/svn/g/gst-plugins-bad-1.2.3.tar.xz'
  sha256 '595d7911a9e6207dea37200587724bdbf841b81a5eb0730118be36976684278c'

  head do
    url 'git://anongit.freedesktop.org/gstreamer/gst-plugins-bad'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'gst-plugins-base'

  depends_on 'dirac' => :optional
  depends_on 'faac' => :optional
  depends_on 'faad2' => :optional
  depends_on 'gnutls' => :optional
  depends_on 'libdvdread' => :optional
  depends_on 'libexif' => :optional
  depends_on 'libmms' => :optional
  depends_on 'rtmpdump' => :optional
  depends_on 'schroedinger' => :optional

  def install
    ENV.append "CFLAGS", "-funroll-loops -fstrict-aliasing"

    args = %W[
      --prefix=#{prefix}
      --disable-apple_media
      --disable-yadif
      --disable-sdl
      --disable-debug
      --disable-dependency-tracking
    ]

    if build.head?
      ENV.append "NOCONFIGURE", "yes"
      system "./autogen.sh"
    end

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
