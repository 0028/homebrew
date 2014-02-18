require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://live555.com/liveMedia/public/live.2014.02.17.tar.gz'
  sha1 '6a769a3541a6e94a56fd788843240a860d777bb1'

  bottle do
    cellar :any
    sha1 "47919d2fc69f3ac7c31729f0e3466a77fd5b5543" => :mavericks
    sha1 "b39c593b6177c9d23f3c6cb05e25607bff77c061" => :mountain_lion
    sha1 "95773bd0b5e96a8fc05a0745170a7e168ee42547" => :lion
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
