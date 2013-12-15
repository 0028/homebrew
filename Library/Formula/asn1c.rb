require 'formula'

class Asn1c < Formula
  homepage 'http://lionet.info/asn1c/blog/'
  url 'http://lionet.info/soft/asn1c-0.9.24.tar.gz'
  sha1 'b12a78d5e0723c01fb9bf3d916be88824b68e6ee'

  bottle do
    sha1 'f41b6ec13d766573476ac340b5d252a26f80fdf9' => :mavericks
    sha1 '8ce5a7531240cea23206ebd996f59ab5ba5d0b52' => :mountain_lion
    sha1 '91055a4f112e875d38c5cca779a1ed1c54eeb8a4' => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end
end
