require 'formula'

class Raptor < Formula
  homepage 'http://librdf.org/raptor/'
  url 'http://download.librdf.org/source/raptor2-2.0.13.tar.gz'
  sha1 '6e9b7db17ab1b6b030e257eb2a25dee7ee2b9838'

  bottle do
    cellar :any
    sha1 "a56e9cd379a85d44d55dc99372db1f87807c0fcb" => :mavericks
    sha1 "05f8ff9dbabdfb35e367c5f67294ae05d4c8ddbe" => :mountain_lion
    sha1 "c2c229086db696406e405aa2a6f0b19eb25cffcd" => :lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
