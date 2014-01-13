require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2014.01.11.tar.gz'
  sha1 '51acfe56d1dab32b5a1040c9c30f7962d89a7bc6'

  bottle do
    cellar :any
    sha1 '2d20a0cd63abff5f6ecd08fded22247e5d8263fa' => :mavericks
    sha1 '6b4658b86bfc340ae71912c32f323a56f0a06557' => :mountain_lion
    sha1 '804e4205ad7a7802eeb224b9c762a45d25a98d35' => :lion
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
