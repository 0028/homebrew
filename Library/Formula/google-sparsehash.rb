require 'formula'

class GoogleSparsehash < Formula
  homepage 'http://code.google.com/p/google-sparsehash/'
  url 'http://sparsehash.googlecode.com/files/sparsehash-2.0.2.tar.gz'
  sha1 '12c7552400b3e20464b3362286653fc17366643e'

  bottle do
    cellar :any
    sha1 '03854bbcfa459a4c276feac1948ff6df483d70a7' => :mavericks
    sha1 '3d3ded82d9e06d9d65be8c0238512646855ace0d' => :mountain_lion
    sha1 '7abbe321468e8f20b31dc3be72b60614b58a86d2' => :lion
  end

  option :cxx11

  def install
    ENV.cxx11 if build.cxx11?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make check"
    system "make install"
  end
end
