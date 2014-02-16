require 'formula'

class GstLibav < Formula
  homepage 'http://gstreamer.freedesktop.org'
  url 'http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.2.3.tar.xz'
  bottle do
    sha1 "eba8703f0d407b56be6727fd4721d26a40741472" => :mavericks
    sha1 "e396e364bd58524db9105b3c934bf451b52db986" => :mountain_lion
    sha1 "dfc6e408611bd989eb5cc318ac00977a675fb06f" => :lion
  end

  mirror 'http://ftp.osuosl.org/pub/blfs/svn/g/gst-libav-1.2.3.tar.xz'
  sha256 'ebc7fbe10955f40df6ccc4bf689075e7e296205fc7ecd8ff383d43c5cdf5bcd6'

  head do
    url 'git://anongit.freedesktop.org/gstreamer/gst-libav'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
    depends_on "gettext"
  end

  depends_on "pkg-config" => :build
  depends_on "yasm" => :build
  depends_on "gst-plugins-base"

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-debug
      --disable-dependency-tracking
    ]

    if build.head?
      ENV["NOCONFIGURE"]="yes"
      system "./autogen.sh"
    end

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    system "#{Formula.factory("gstreamer").opt_prefix}/bin/gst-inspect-1.0", "libav"
  end
end
