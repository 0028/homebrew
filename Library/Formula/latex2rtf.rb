require 'formula'

class Latex2rtf < Formula
  homepage 'http://latex2rtf.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/latex2rtf/latex2rtf-unix/2.3.6/latex2rtf-2.3.6.tar.gz'
  sha1 'd0436c52ec4d82f379cdbd7c8b00ddac4f015da5'

  bottle do
    sha1 "75fe10a28189f272408f7c7f896c6d0a98b5bd2d" => :mavericks
    sha1 "023c1b84690607a4c83e43764307abd2ba6b5d8d" => :mountain_lion
    sha1 "e214fabac0431fb75cef5c3d0ed60276802299a1" => :lion
  end

  def install
    inreplace 'Makefile', "cp -p doc/latex2rtf.html $(DESTDIR)$(SUPPORTDIR)", "cp -p doc/web/* $(DESTDIR)$(SUPPORTDIR)"
    system "make", "DESTDIR=",
                   "BINDIR=#{bin}",
                   "MANDIR=#{man1}",
                   "INFODIR=#{info}",
                   "SUPPORTDIR=#{share}/latex2rtf",
                   "CFGDIR=#{share}/latex2rtf/cfg",
                   "install"
  end
end
