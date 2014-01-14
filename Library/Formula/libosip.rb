require 'formula'

class Libosip < Formula
  homepage 'http://www.gnu.org/software/osip/'
  url 'http://ftpmirror.gnu.org/osip/libosip2-4.1.0.tar.gz'
  bottle do
    cellar :any
    sha1 'c8bd26a92294bde3a26c8699926d3c63d9f107c9' => :mavericks
    sha1 '7965738eced463bbbafb16d10a75f33474c4271c' => :mountain_lion
    sha1 '1e2b3261b5c7f5911bbc39c101b38aa487b8ac81' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/osip/libosip2-4.1.0.tar.gz'
  sha1 '61459c9052ca2f5e77a6936c9b369e2b0602c080'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
