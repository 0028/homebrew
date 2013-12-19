require 'formula'

class IsoCodes < Formula
  homepage 'http://pkg-isocodes.alioth.debian.org/'
  url 'http://pkg-isocodes.alioth.debian.org/downloads/iso-codes-3.49.tar.xz'
  sha1 '2a9836429423343ec9631b30fdb177b733bdef7c'

  bottle do
    sha1 '83c9cabc9b667cd07fe25fec258fa275ddf2573e' => :mavericks
    sha1 '1f588037890e846cabe7ba9d98ae3d8131a2ff2f' => :mountain_lion
    sha1 '58ce86aaf9ed4f2b4ad7f7fb734d017aed02de46' => :lion
  end

  depends_on 'xz' => :build
  depends_on 'gettext' => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
