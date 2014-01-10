require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2014.01.07.tar.gz'
  sha1 '09fcf815a448d0ba27cff367099a241adde97a33'

  bottle do
    cellar :any
    sha1 '3bbfb1197146f14409b97b8e3426b230d73875a0' => :mavericks
    sha1 'c67cec9c4bef8413535d272fc22e02704a4ec5a2' => :mountain_lion
    sha1 'b9696f401ab17ccc2c4edb56d35e1c4c93d4817f' => :lion
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
