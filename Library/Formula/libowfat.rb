require 'formula'

class Libowfat < Formula
  url 'http://dl.fefe.de/libowfat-0.29.tar.bz2'
  head 'cvs://:pserver:cvs:@cvs.fefe.de:/cvs:libowfat'
  sha1 'f944ebac326f4a8bd1437ff995d0b8201280434c'
  bottle do
    cellar :any
    sha1 "906045f1781518e4e019718bb5cd8423c3ba558d" => :mavericks
    sha1 "5952cab66fc648c110419dc05761f453b38da5a7" => :mountain_lion
    sha1 "5284a627485a8ea90d1c0f83beb066d85cb208f6" => :lion
  end

  homepage 'http://www.fefe.de/libowfat/'

  def install
    system "make", "libowfat.a"
    system "make", "install", "prefix=#{prefix}", "MAN3DIR=#{man3}", "INCLUDEDIR=#{include}/libowfat"
  end
end
