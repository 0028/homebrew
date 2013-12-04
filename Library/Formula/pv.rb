require 'formula'

class Pv < Formula
  homepage 'http://www.ivarch.com/programs/pv.shtml'
  url 'http://www.ivarch.com/programs/sources/pv-1.4.12.tar.bz2'
  sha1 'ce1b9b90a0f6bdfb533d548b3d56d83cd1df4fd3'

  bottle do
    sha1 '75171dd9e4b946836916ba884f2fdd84d8037926' => :mavericks
    sha1 'a19b9e81429fdb878b70d7d18369d5cbe4924c24' => :mountain_lion
    sha1 '06d6ff0ed14103e039c8a7677b457a76a8f82826' => :lion
  end

  depends_on 'gettext'

  fails_with :llvm do
    build 2334
  end

  def install
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end
end
