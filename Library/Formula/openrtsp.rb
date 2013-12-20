require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2013.12.18.tar.gz'
  sha1 '26869d10f59b71deff6d32cc45a91f5ea20c93a5'

  bottle do
    cellar :any
    sha1 'ad5d1f8deba6b0ac332c631e7a636341591f715b' => :mavericks
    sha1 '5dad7ee4729ad7ff210f4951ba847b6c26734868' => :mountain_lion
    sha1 '0127ad6a9a950d9d0e5f321b28400d95bc71f088' => :lion
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
