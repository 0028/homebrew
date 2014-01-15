require 'formula'

class Pdf2json < Formula
  homepage 'http://code.google.com/p/pdf2json/'
  url 'http://pdf2json.googlecode.com/files/pdf2json-0.68.tar.gz'
  sha1 '1cb0f4b3b1216c6ce515fd256d92ac196d002a7e'

  bottle do
    sha1 'f228da2eb5e50206b5d0fb7ed3dea9c7529dfb8c' => :mavericks
    sha1 'a5913fbcc5cf18127e37447a7bdb4ea817a1f17c' => :mountain_lion
    sha1 'abdb2473a3c24354fc6c567d3a8fb8b50fdf442c' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    # Fix manpage install location. See:
    # http://code.google.com/p/pdf2json/issues/detail?id=2
    inreplace "Makefile", "/man/", "/share/man/"
    system "make", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}"
    bin.install 'src/pdf2json'
  end
end
