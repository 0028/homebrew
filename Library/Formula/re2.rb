require 'formula'

class Re2 < Formula
  homepage 'https://code.google.com/p/re2/'
  url 'https://re2.googlecode.com/files/re2-20140111.tgz'
  sha1 'd51b3c2e870291070a1bcad8e5b471ae83e1f8df'

  head 'https://re2.googlecode.com/hg'

  bottle do
    cellar :any
    sha1 'a527a0b648e3b3bda1ffe11f1ba0644c01bd5d47' => :mavericks
    sha1 '4b338ba57c1edddc6b6ba3c88d6784b10c5b192f' => :mountain_lion
    sha1 '83120a63295e84ad0204c15e9ee3a18a5b723e5a' => :lion
  end

  def install
    # https://code.google.com/p/re2/issues/detail?id=99
    if MacOS.version < :mavericks
      inreplace 'libre2.symbols.darwin',
                '__ZlsRNSt3__113basic_ostreamIcNS_11char_traitsIcEEEERKN3re211StringPieceE',
                '__ZlsRSoRKN3re211StringPieceE'
    end
    system "make", "install", "prefix=#{prefix}"
    mv lib/"libre2.so.0.0.0", lib/"libre2.0.0.0.dylib"
    ln_s "libre2.0.0.0.dylib", lib/"libre2.0.dylib"
    ln_s "libre2.0.0.0.dylib", lib/"libre2.dylib"
  end
end
