require 'formula'

class Srmio < Formula
  homepage 'http://www.zuto.de/project/srmio/'
  url 'http://www.zuto.de/project/files/srmio/srmio-0.1.1~git1.tar.gz'
  sha1 '0db685d6046fca38ad64df05840d01b5f3b27499'

  bottle do
    cellar :any
    sha1 '4392664dccce8f72ccc6fd0038c56e32ed4d8e27' => :mavericks
    sha1 '5afd310a96cc6f49ab4840d71ea8fe1bbfab1e86' => :mountain_lion
    sha1 '099f49f52eda75eb834749a83d3f61632abb4817' => :lion
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
    system "#{bin}/srmcmd", "--help"
  end
end
