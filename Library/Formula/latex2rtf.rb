require 'formula'

class Latex2rtf < Formula
  homepage 'http://latex2rtf.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/latex2rtf/latex2rtf-unix/2.3.5/latex2rtf-2.3.5.tar.gz'
  sha1 '12d5d33b8b3c841a401bcdaf50752259cd3aa5d5'

  bottle do
    sha1 "7bb2f50a1fc5715fe34016203ace273f7c2d856d" => :mavericks
    sha1 "166c2ac688256617f1a391898503844d5e6b03e4" => :mountain_lion
    sha1 "d6814707c484f87b29d086f0e0121abbd1d5dea9" => :lion
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
