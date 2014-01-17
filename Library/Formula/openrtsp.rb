require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2014.01.17.tar.gz'
  sha1 'b7a9be7574f674ecee57d9f64f8c3ddba799d963'

  bottle do
    cellar :any
    sha1 '75afb7ffe813221fa0785233a9a608780c3c8cf6' => :mavericks
    sha1 'a4b87ddfb25dc8079c69eae4f524c07969a603f6' => :mountain_lion
    sha1 '93fe958c4f8ca66461c445e91d93fa3c965cc3b0' => :lion
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
