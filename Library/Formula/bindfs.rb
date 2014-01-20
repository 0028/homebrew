require 'formula'

class Bindfs < Formula
  homepage 'http://bindfs.org/'
  url 'http://bindfs.googlecode.com/files/bindfs-1.12.tar.gz'
  sha1 'e4d5d9ab3056c06e1e8b9fe423222de86cce46cf'

  bottle do
    cellar :any
    sha1 "0f07a3098159f960ca9c28858ef75a4709cdb33e" => :mavericks
    sha1 "d6e4ff602e30baca114a2af35e6b8d09cb730e3e" => :mountain_lion
    sha1 "ab31820287538acf9a4de3802eaa213257c25b32" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/bindfs", "-V"
  end
end
