require 'formula'

class Parallel < Formula
  homepage 'http://savannah.gnu.org/projects/parallel/'
  url 'http://ftpmirror.gnu.org/parallel/parallel-20140222.tar.bz2'
  bottle do
    cellar :any
    sha1 "145e28b8b9ffdd83efa948507d70ad4f62eab353" => :mavericks
    sha1 "f040acffaaa2bb694beb504cea88d5cea58f4846" => :mountain_lion
    sha1 "386a76886128762d5f83afd0cdbb3bfed2d3fe11" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/parallel/parallel-20140222.tar.bz2'
  sha256 '7e74cc72d350cfab0bfff64c1910773030e74ca0ee5f60e528cae425d283637d'

  conflicts_with 'moreutils',
    :because => "both install a 'parallel' executable."

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
