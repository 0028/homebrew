require 'formula'

class Embryo < Formula
  homepage 'http://trac.enlightenment.org/e/wiki/Embryo'
  url 'http://download.enlightenment.org/releases/embryo-1.7.9.tar.gz'
  sha1 '1644da0be669213ce9ed29f1b58e9c6f3ab7c05c'

  bottle do
    sha1 '1ec55578d34ecfe6257de4f192f88232bb789247' => :mavericks
    sha1 'd9a7d22213584d7119e1414013236459b5648feb' => :mountain_lion
    sha1 '389e7e7ab003e4d32b6faedbb93085f9529d0574' => :lion
  end

  head do
    url 'http://svn.enlightenment.org/svn/e/trunk/embryo/'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'pkg-config' => :build
  depends_on 'eina'

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
