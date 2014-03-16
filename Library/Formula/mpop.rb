require 'formula'

class Mpop < Formula
  homepage 'http://mpop.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/mpop/mpop/1.0.29/mpop-1.0.29.tar.bz2'
  sha1 '489ff6ae4d662af4179d9affc86e79db94ed95b5'

  bottle do
    cellar :any
    sha1 "3f219c35676c82ca5c410379fab835083d63aa1b" => :mavericks
    sha1 "ea23c59c844cdf0c55e1bd834f660456c1f83329" => :mountain_lion
    sha1 "bbf6f9eb47b44888835c22706df2a621b4ea640d" => :lion
  end

  depends_on 'pkg-config' => :build

  def install
    system './configure', "--prefix=#{prefix}", '--disable-dependency-tracking'
    system "make install"
  end
end
