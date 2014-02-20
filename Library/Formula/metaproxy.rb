require 'formula'

class Metaproxy < Formula
  homepage 'http://www.indexdata.com/metaproxy'
  url 'http://ftp.indexdata.dk/pub/metaproxy/metaproxy-1.4.4.tar.gz'
  sha1 '6fcbbea905fceeb2af047598ca2685ef0f58b965'

  bottle do
    cellar :any
    sha1 "cb9913cff540231142084362a954b347effd96aa" => :mavericks
    sha1 "e836166f57ef94559745b318cc7d474ece32b9ba" => :mountain_lion
    sha1 "37daed2a6769789d5be233ff6279e80cbc451d4e" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'yazpp'
  depends_on 'boost'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
