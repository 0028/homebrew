require 'formula'

class Libao < Formula
  homepage 'http://www.xiph.org/ao/'
  url 'http://downloads.xiph.org/releases/ao/libao-1.2.0.tar.gz'
  sha1 '6b1d2c6a2e388e3bb6ebea158d51afef18aacc56'

  bottle do
    sha1 "f99dbd0ad01718cca1fe979a03ea44cf4e63a765" => :mavericks
    sha1 "824966ede3225bab0788a70499a58470665370ba" => :mountain_lion
    sha1 "c2ca96e5ca4833d67922ed572d1f5c27fbea757f" => :lion
  end

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-static"
    system "make install"
  end
end
