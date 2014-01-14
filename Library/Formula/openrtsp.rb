require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2014.01.13.tar.gz'
  sha1 'e617930d23ef55381613121c2ea921ce59b9ee0e'

  bottle do
    cellar :any
    sha1 '437f789c3b912bb77542bf81e107731f53626917' => :mavericks
    sha1 'a5206a185a0e99b753ee6e46c6299719621af37c' => :mountain_lion
    sha1 'a97aa07a41239852b7ff16944c94a59cc29e5233' => :lion
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
