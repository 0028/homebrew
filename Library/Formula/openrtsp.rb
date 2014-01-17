require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2014.01.17.tar.gz'
  sha1 'b7a9be7574f674ecee57d9f64f8c3ddba799d963'

  bottle do
    cellar :any
    sha1 'a7cf13c8b203e56c193ab5662b609f461d9efd97' => :mavericks
    sha1 '8d2d0d5f17898309ee4f1838a871b65a190bb97a' => :mountain_lion
    sha1 '772274acb4b68055895e5c3af50d6a0ec8fe173a' => :lion
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
