require 'formula'

class Bison < Formula
  homepage 'http://www.gnu.org/software/bison/'
  url 'http://ftpmirror.gnu.org/bison/bison-3.0.1.tar.gz'
  bottle do
    sha1 '1e4c5d70338e2e78d1c62620c8504dea4949e546' => :mavericks
    sha1 '4f497ca8d4ad016b67fb2a2547cd8fbfbbbecca2' => :mountain_lion
    sha1 '384fd635680223d0e655a24fc61aeb3107c656ae' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/bison/bison-3.0.1.tar.gz'
  sha1 '0191d1679525b1e05bb35265a71e7475e7cb1432'

  keg_only :provided_by_osx, 'Some formulae require a newer version of bison.'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
