require 'formula'

class LittleCms2 < Formula
  homepage 'http://www.littlecms.com/'
  url 'http://downloads.sourceforge.net/project/lcms/lcms/2.5/lcms2-2.5.tar.gz'
  sha1 'bab3470471fc7756c5fbe71be9a3c7d677d2ee7b'

  bottle do
    cellar :any
    sha1 'ad0d11f07ca396502106af1ab371a8aeefe67a25' => :mavericks
    sha1 '380b58abfeb0eb855c4a8ebf341d931132707c3e' => :mountain_lion
    sha1 '616b4b68a7edfa08b00a7b1aef7d484e83775d63' => :lion
  end

  depends_on 'jpeg' => :recommended
  depends_on 'libtiff' => :recommended

  option :universal

  def install
    ENV.universal_binary if build.universal?

    args = %W{--disable-dependency-tracking --prefix=#{prefix}}
    args << "--without-tiff" if build.without? "libtiff"
    args << "--without-jpeg" if build.without? "jpeg"

    system "./configure", *args
    system "make install"
  end
end
