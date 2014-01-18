require 'formula'

class Libgphoto2 < Formula
  homepage 'http://www.gphoto.org/proj/libgphoto2/'
  url 'http://downloads.sourceforge.net/project/gphoto/libgphoto/2.5.3.1/libgphoto2-2.5.3.1.tar.bz2'
  sha1 '6e5c9254c65d4768ac4e4c1a423147542005987f'

  bottle do
    sha1 'ce701878a588e9b3690a1b0b3413ed243adb6537' => :mavericks
    sha1 '756dc092ea4cb29b58acf10e693cabe870637c15' => :mountain_lion
    sha1 '3e6fa398e5e045446c1e4573e19d251dd6bd3e73' => :lion
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
