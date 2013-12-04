require 'formula'

class Srmio < Formula
  homepage 'http://www.zuto.de/project/srmio/'
  url 'http://www.zuto.de/project/files/srmio/srmio-0.1.1~git1.tar.gz'
  sha1 '0db685d6046fca38ad64df05840d01b5f3b27499'
  version '0.1.1~git1'

  bottle do
    cellar :any
    sha1 'f158ec8e0555b0e92c94ed51e582702d8bdb01c8' => :mavericks
    sha1 '2ed445e9d073f8360c010a6f00a3e7284fae42e3' => :mountain_lion
    sha1 '9084dac9180adcdab473414c0d5575ee110e33db' => :lion
  end

  head do
    url 'https://github.com/rclasen/srmio.git'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  def install
    if build.head?
       system "chmod u+x genautomake.sh"
      system "./genautomake.sh"
    end
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/srmcmd", "--version"
  end
end
