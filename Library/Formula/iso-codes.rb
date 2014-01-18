require 'formula'

class IsoCodes < Formula
  homepage 'http://pkg-isocodes.alioth.debian.org/'
  url 'http://pkg-isocodes.alioth.debian.org/downloads/iso-codes-3.50.tar.xz'
  sha1 '250d22b2977a6f5a536753d85af85917474cf312'

  bottle do
    sha1 '7e95502527ceb0cb71189dd86a772cca04485d15' => :mavericks
    sha1 '0b41b4d7ce624ddd63aac4c3cfa76bf342eea707' => :mountain_lion
    sha1 '1bd9d04229b8d4cdc5981c8a8192a6722b839b1b' => :lion
  end

  depends_on 'xz' => :build
  depends_on 'gettext' => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
