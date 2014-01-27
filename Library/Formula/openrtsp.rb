require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2014.01.24.tar.gz'
  sha1 '495e6b9d8f6c5e481d53861ac9ceab5373d8d858'

  bottle do
    cellar :any
    sha1 "57d0df63c833b998487f9ad5c8a261ad2aeb228b" => :mavericks
    sha1 "28862f91c8464f065122ed36b028edb234f4d6ea" => :mountain_lion
    sha1 "7cbc0e6a88c5a5a2425ed618aa22b94209e99929" => :lion
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
