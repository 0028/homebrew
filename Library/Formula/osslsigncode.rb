require 'formula'

class Osslsigncode < Formula
  homepage 'http://sourceforge.net/projects/osslsigncode/'
  url 'http://downloads.sourceforge.net/project/osslsigncode/osslsigncode/osslsigncode-1.5.2.tar.gz'
  sha1 'b33139d3fe41fa4dd8093d325fd02d165314a48b'

  bottle do
    cellar :any
    sha1 '0b5e31847186079e7dd7cf285b0562cb54a1b1c6' => :mavericks
    sha1 'c043b41e5b98dd6af98faf16335cf94eca8ae1d5' => :mountain_lion
    sha1 '4babd95cbb9ceceeeb725f35bc5d0bd90ad499eb' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'openssl'
  depends_on 'libgsf' => :optional

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
