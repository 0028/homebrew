require 'formula'

class Libxmp < Formula
  homepage 'http://xmp.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/xmp/libxmp/4.2.0/libxmp-4.2.0.tar.gz'
  sha1 '138599f4a29f4b25c6c812b0e226e554776a77d3'

  bottle do
    cellar :any
    sha1 '24303b406e734e8e8c7a25fdb78ee4121b5e7be1' => :mavericks
    sha1 '3c977c8370b5c87dac6c813de6953ebedea27e9c' => :mountain_lion
    sha1 'c48e9af518a9f485283277660e4bc6ccae6fa017' => :lion
  end

  head do
    url 'git://git.code.sf.net/p/xmp/libxmp'
    depends_on :autoconf
  end

  def install
    system "autoconf" if build.head?
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
