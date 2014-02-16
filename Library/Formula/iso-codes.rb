require 'formula'

class IsoCodes < Formula
  homepage 'http://pkg-isocodes.alioth.debian.org/'
  url 'http://pkg-isocodes.alioth.debian.org/downloads/iso-codes-3.51.tar.xz'
  sha1 '2616a3f3420fab69b800675df7456175f87e0cdf'

  bottle do
    sha1 "08dd544b7a77f6da3e8d55d4c11671d54114a1cb" => :mavericks
    sha1 "80549a948534f3a4bc073e10c91d6074a4d65635" => :mountain_lion
    sha1 "85bb7c3cedc12a07a2b75e051197409e3e15f0ec" => :lion
  end

  depends_on 'xz' => :build
  depends_on 'gettext' => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
