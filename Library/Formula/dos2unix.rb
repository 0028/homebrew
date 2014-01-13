require 'formula'

class Dos2unix < Formula
  homepage 'http://waterlan.home.xs4all.nl/dos2unix.html'
  url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.4.tar.gz'
  sha1 '93d73148c09908a42dcbf5339312c9aa1f18ba7c'

  bottle do
    sha1 'a643d874fb75e8bbb9a588529ed7f8ee8047403f' => :mavericks
    sha1 '6e0646e1000a19bac806599ecc36a553ecf00f6d' => :mountain_lion
    sha1 'a78285edd978b4a6aaeb224ffd33992325ba0942' => :lion
  end

  depends_on 'gettext'

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
