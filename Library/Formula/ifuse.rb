require 'formula'

class Ifuse < Formula
  homepage 'http://www.libimobiledevice.org/'
  url 'https://github.com/libimobiledevice/ifuse/archive/1.1.3.tar.gz'
  sha1 '447e9309fba1979be98ec83a4627b421dbd83032'

  head 'http://cgit.sukimashita.com/ifuse.git'

  bottle do
    cellar :any
    sha1 "8807b68ceed6630cc0b60145657660258ad8fc92" => :mavericks
    sha1 "e2fb2d73734ed7050950f29b63035d547a0ec155" => :mountain_lion
    sha1 "2ab650a8602ceff87b43199ee2ad1d4405506afd" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'glib'
  depends_on 'libimobiledevice'
  depends_on 'osxfuse'

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
