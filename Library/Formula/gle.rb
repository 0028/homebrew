require 'formula'

class Gle < Formula
  homepage 'http://glx.sourceforge.net/'
  url 'https://downloads.sourceforge.net/glx/gle-graphics-4.2.4cf-src.tar.gz'
  version '4.2.4c'
  sha1 '5528528dfe54c74f69bfad174105d55a3dd90e49'

  bottle do
    sha1 "e7ca10d97aa70e5b51e61ee6dd4d5c5e45fa1aad" => :mavericks
    sha1 "cd5e8aed4c52ca4d853de52ca42626f054ec528e" => :mountain_lion
    sha1 "03fd063296b4cbd1a671089227fb03bea84cda24" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on :x11
  depends_on 'jpeg' => :optional
  depends_on 'libtiff' => :optional
  depends_on 'cairo' => :build

  # fix namespace issues causing compilation errors
  # https://trac.macports.org/ticket/41760
  patch :p0 do
    url "https://trac.macports.org/raw-attachment/ticket/41760/patch-hash-map.diff"
    sha1 "fafa7654f69ace53835b8e7953e715384e16da91"
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--with-arch=#{MacOS.preferred_arch}",
                          "--without-qt"

    inreplace 'Makefile', "MKDIR_P", "mkdir -p"

    system "make"
    ENV.deparallelize
    system "make install"
  end
end
