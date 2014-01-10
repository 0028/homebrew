require 'formula'

class GedaGaf < Formula
  homepage 'http://www.geda-project.org/'
  url 'http://ftp.geda-project.org/geda-gaf/stable/v1.8/1.8.2/geda-gaf-1.8.2.tar.gz'
  sha1 'c61edc04997fc12398534a346dac32d8fcdabcc1'

  bottle do
    sha1 'b969e66f29995df10ff0a26f1a09e74de7e5796e' => :mavericks
    sha1 'eba043e0016acde80e5c21a70e73d26204752540' => :mountain_lion
    sha1 '18b9b0cfcff6c05c63bfb85af91e7589f525a40e' => :lion
  end

  devel do
    url 'http://ftp.geda-project.org/geda-gaf/unstable/v1.9/1.9.0/geda-gaf-1.9.0.tar.gz'
    sha1 '2b6732238ca5ed6693695d737e52aef1bdb2a589'
  end

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'gtk+'
  depends_on 'guile'
  depends_on 'gawk'
  depends_on :x11

  def install
    # Help configure find libraries
    gettext = Formula.factory('gettext')
    pcb = Formula.factory('pcb')

    extra_configure_args = []
    if !build.devel?
      extra_configure_args << "--with-pcb-confdir=#{pcb.etc/:pcb}"
    end
    system "./configure", "--prefix=#{prefix}",
                          "--with-gettext=#{gettext.prefix}",
                          "--disable-update-xdg-database",
                          "--with-pcb-datadir=#{HOMEBREW_PREFIX/:share/:pcb}",
                          *extra_configure_args

    system "make"
    system "make install"
  end

  def caveats
    "This software runs under X11."
  end
end

