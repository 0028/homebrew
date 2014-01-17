require 'formula'

class Gphoto2 < Formula
  homepage 'http://gphoto.org/'
  url 'http://downloads.sourceforge.net/project/gphoto/gphoto/2.5.3/gphoto2-2.5.3.tar.bz2'
  sha1 '5e3c696d035097129fe4b47188083e9496e04c44'

  bottle do
    cellar :any
    sha1 'c3e03aedc08fb07c273d254974f5a96548046f07' => :mavericks
    sha1 '73dfab0dd088888c3159a06a9004a9f0e527d020' => :mountain_lion
    sha1 '18a2790651ed510b77e9d5a5a85aca0c58beaec1' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'jpeg'
  depends_on 'libgphoto2'
  depends_on 'popt'
  depends_on 'readline'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
