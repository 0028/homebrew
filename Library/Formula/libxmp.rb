require 'formula'

class Libxmp < Formula
  homepage 'http://xmp.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/xmp/libxmp/4.2.0/libxmp-4.2.0.tar.gz'
  sha1 '138599f4a29f4b25c6c812b0e226e554776a77d3'

  bottle do
    cellar :any
    sha1 'a971813f80f7b716488a413956353ce4ce597916' => :mavericks
    sha1 'ed245269d3f2773ec55de1ec254e52cb4288f29b' => :mountain_lion
    sha1 'bdca44c3afe837904009806efb7ab4ef8ece2b9a' => :lion
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
