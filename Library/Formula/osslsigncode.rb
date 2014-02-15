require 'formula'

class Osslsigncode < Formula
  homepage 'http://sourceforge.net/projects/osslsigncode/'
  url 'http://downloads.sourceforge.net/project/osslsigncode/osslsigncode/osslsigncode-1.6.tar.gz'
  sha1 '83c169638c8c1e0122127674cbb73d2e0e6b5bc2'

  bottle do
    cellar :any
    sha1 "09def8524e361a192af0c2cde0a6b1099e49b769" => :mavericks
    sha1 "cb47683cfcba4bd3e877e62be7448e44a14ab536" => :mountain_lion
    sha1 "40c8ff243d73fbbb16f3cee85538fb63fc6458ba" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'openssl'
  depends_on 'libgsf' => :optional

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
