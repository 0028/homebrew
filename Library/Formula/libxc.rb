require 'formula'

class Libxc < Formula
  homepage 'http://www.tddft.org/programs/octopus/wiki/index.php/Libxc'
  url 'http://www.tddft.org/programs/octopus/down.php?file=libxc/libxc-2.0.3.tar.gz'
  sha1 '83797998a42ea3062e8b7b82207577b8063b6e42'

  bottle do
    cellar :any
    sha1 "e02a966607671773517fd325a9e0241b5e887bda" => :mavericks
    sha1 "ca65ba3c8224f264009a887b36c66d75866168da" => :mountain_lion
    sha1 "5e8b83145b12794b797f50a87d7d1755f0a332ae" => :lion
  end

  depends_on :fortran

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--enable-shared",
                          "FCCPP=#{ENV.fc} -E -x c",
                          "CC=#{ENV.cc}",
                          "CFLAGS=-pipe"
    system "make"
    system "make install"
  end
end
