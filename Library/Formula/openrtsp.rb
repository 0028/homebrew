require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2014.01.16.tar.gz'
  sha1 'f2d88e51b872c7f1cde42190933f7990523bec63'

  bottle do
    cellar :any
    sha1 'f285c9d947ab3734ef7bbd074f0eb80739ce29e3' => :mavericks
    sha1 '845ee7fa1fe491d07fd43fab89f2576aa861c32b' => :mountain_lion
    sha1 '6166bd047eff1b44fe51b97d184944070f6f9962' => :lion
  end

  option "32-bit"

  def install
    if build.build_32_bit? || !MacOS.prefer_64_bit?
      ENV.m32
      system "./genMakefiles macosx-32bit"
    else
      system "./genMakefiles macosx"
    end

    system "make", "PREFIX=#{prefix}", "install"
  end
end
