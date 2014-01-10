require 'formula'

class Gtkwave < Formula
  homepage 'http://gtkwave.sourceforge.net/'
  url 'http://gtkwave.sourceforge.net/gtkwave-3.3.54.tar.gz'
  sha1 '761ba7118c06c3dc0ed5be3a09f9c39d051e6794'

  bottle do
    cellar :any
    sha1 'e9fa7ef92b566364ea94c28efc0a2410747fbb95' => :mavericks
    sha1 'e0525baa936f21a956552b783b7993c38d01d05e' => :mountain_lion
    sha1 'd63eaf42e6212785d64d18647116d089f148e35d' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'gtk+'
  depends_on 'xz'
  depends_on :x11

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
