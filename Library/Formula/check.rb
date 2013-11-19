require 'formula'

class Check < Formula
  homepage 'http://check.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/check/check/0.9.11/check-0.9.11.tar.gz'
  sha1 '84b5af72dd49df4ac837645d117ce9126535d549'

  bottle do
    cellar :any
    sha1 'dd6d321543728deea2bcab12a8be9ecd0fc13221' => :mavericks
    sha1 'f98d4c1f91a8f46431154242e46556602c11f249' => :mountain_lion
    sha1 '15bfc004f992a6b33c10640acff89802bd2b0eef' => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
