require 'formula'

class Openrtsp < Formula
  homepage 'http://www.live555.com/openRTSP'
  url 'http://www.live555.com/liveMedia/public/live.2014.01.18.tar.gz'
  sha1 '3a076398589aad058081cb87e900a3b7908d696e'

  bottle do
    cellar :any
    sha1 'e41fb89139c87a38b1b13d7952dd7bbd80f6eb73' => :mavericks
    sha1 '2b5f6106e9fed9159caa5de402cde0f44c2b8a12' => :mountain_lion
    sha1 'b6863cb6cf12b29056609e69c740bfa89ab213dc' => :lion
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
