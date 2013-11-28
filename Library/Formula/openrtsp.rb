require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2013.11.26.tar.gz'
  sha1 '510e0d349100b748b414783c6bf5b636251d98b1'

  bottle do
    cellar :any
    sha1 'ee2ccb4c4ffd3ca4bc6c6e0eda622f2e4286bf51' => :mavericks
    sha1 'e8986c85dc07a7e7399eae7cae4638d7a21dbe74' => :mountain_lion
    sha1 '9501fdb75fd9ef1a2be2835d0f9f27587f70517f' => :lion
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
