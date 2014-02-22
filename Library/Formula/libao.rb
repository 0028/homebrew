require 'formula'

class Libao < Formula
  homepage 'http://www.xiph.org/ao/'
  url 'http://downloads.xiph.org/releases/ao/libao-1.2.0.tar.gz'
  sha1 '6b1d2c6a2e388e3bb6ebea158d51afef18aacc56'

  bottle do
    sha1 "0c92d70c991c9a8780cda2244eff9a1c574c40e0" => :mavericks
    sha1 "3e3db890212ad9bb0b2299f903f47701bb264600" => :mountain_lion
    sha1 "a861ff4bf86d1f18d998fe62e9658eefd3a283e7" => :lion
  end

  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-static"
    system "make install"
  end
end
