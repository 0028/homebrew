require 'formula'

class LcdfTypetools < Formula
  homepage 'http://www.lcdf.org/type/'
  url 'http://www.lcdf.org/type/lcdf-typetools-2.100.tar.gz'
  sha256 '7ae7940df8a33de945c401e81aed414df796db692a30e38ba734c6117b73b2cd'

  bottle do
    sha1 'd34dfb890f78280f431707ae87dc6c5eb6409755' => :mavericks
    sha1 '653325617237de72c5b16061605f00c5e8c71c53' => :mountain_lion
    sha1 '31df271b154f297e13f3ca5ec8b90274c34c85ab' => :lion
  end

  conflicts_with 'open-mpi', :because => 'both install same set of binaries.'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--without-kpathsea"
    system "make install"
  end
end
