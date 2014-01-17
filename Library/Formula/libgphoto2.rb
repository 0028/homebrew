require 'formula'

class Libgphoto2 < Formula
  homepage 'http://www.gphoto.org/proj/libgphoto2/'
  url 'http://downloads.sourceforge.net/project/gphoto/libgphoto/2.5.3/libgphoto2-2.5.3.tar.bz2'
  sha1 '42c4d99e8036f4fc113de0daf6b8029e4d81f570'

  bottle do
    sha1 'c9133fb1c14affd0b063df27a17a62447cdebc9c' => :mavericks
    sha1 'cc0df8c72b5fdea4397e9e3f1b8452a2e4ca4c4e' => :mountain_lion
    sha1 '18de2b6e5548edcd1d45be3bc24ec1360ef7f081' => :lion
  end

  option :universal

  depends_on 'pkg-config' => :build
  depends_on :libtool => :run
  depends_on 'libusb-compat'
  depends_on 'gd'
  depends_on 'libexif' => :optional

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "CFLAGS=-D_DARWIN_C_SOURCE"
    system "make install"
  end
end
