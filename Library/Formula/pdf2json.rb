require 'formula'

class Pdf2json < Formula
  homepage 'http://code.google.com/p/pdf2json/'
  url 'http://pdf2json.googlecode.com/files/pdf2json-0.66.tar.gz'
  sha1 'e00cb966d9bf1952b56696210788656b7e58094a'

  bottle do
    sha1 'c3e4e665f0894e212db992c2e2bce5c559ce31c4' => :mavericks
    sha1 'd49776ee80ce6ba02b8978d8b239b41e38e637ac' => :mountain_lion
    sha1 '4ade535b0a7ffe2fd9b330e5e13075838b2e3340' => :lion
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
