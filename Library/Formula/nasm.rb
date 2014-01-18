require 'formula'

class Nasm < Formula
  homepage 'http://www.nasm.us/'
  url 'http://www.nasm.us/pub/nasm/releasebuilds/2.11/nasm-2.11.tar.bz2'
  sha256 '1ce7e897c67255a195367a60c739a90a0b33a4a73f058f7cda3253bcf975642b'

  bottle do
    cellar :any
    sha1 '9c24888e1481c9a7e593a0ee86d96302f55c21ed' => :mavericks
    sha1 '296d39acf976a0903427c09f8ab57e8361c857c1' => :mountain_lion
    sha1 '0730292bf7d154d0dd981da1e3c85f3507664939' => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}"
    system "make install install_rdf"
  end
end
