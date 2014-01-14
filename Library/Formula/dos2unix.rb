require 'formula'

class Dos2unix < Formula
  homepage 'http://waterlan.home.xs4all.nl/dos2unix.html'
  url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.4.tar.gz'
  sha1 '93d73148c09908a42dcbf5339312c9aa1f18ba7c'

  bottle do
    sha1 '74271179d1acecc6dd4a0e63cf257b505596cedb' => :mavericks
    sha1 '0bf2c08f1101fa6d86519e0c9180a9bf77c7e431' => :mountain_lion
    sha1 'b4854850d74591e7562fc006151161a53d2114eb' => :lion
  end

  depends_on 'gettext'

  devel do
    url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.5-beta1.tar.gz'
    sha1 'bc00e0eb920c1aa02f7c99ccb355837ecce31b03'
  end

  def install
    gettext = Formula.factory("gettext")
    system "make", "prefix=#{prefix}",
                   "CC=#{ENV.cc}",
                   "CPP=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "CFLAGS_OS=-I#{gettext.include}",
                   "LDFLAGS_EXTRA=-L#{gettext.lib} -lintl",
                   "install"
  end
end
