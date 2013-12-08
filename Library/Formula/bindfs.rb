require 'formula'

class Bindfs < Formula
  homepage 'http://bindfs.org/'
  url 'http://bindfs.googlecode.com/files/bindfs-1.12.tar.gz'
  sha1 'e4d5d9ab3056c06e1e8b9fe423222de86cce46cf'

  bottle do
    cellar :any
    sha1 '458cf77653e8e1be2ecd97011e4c419833a057a6' => :mavericks
    sha1 'fd2d4a217076f6b436c72de67d121da499227e1b' => :mountain_lion
    sha1 '8b9ce33f1be97fd2cfc37bee5db283ff9a822700' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'fuse4x'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/bindfs", "-V"
  end
end
