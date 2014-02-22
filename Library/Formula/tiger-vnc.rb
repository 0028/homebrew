require 'formula'

class TigerVnc < Formula
  homepage 'http://tigervnc.org/'
  url 'http://downloads.sourceforge.net/project/tigervnc/tigervnc/1.3.0/tigervnc-1.3.0.tar.bz2'
  sha1 'eda373336bee1bcfa806df1ea6389d918945a258'

  bottle do
    sha1 "efca878d19fc3293eb1e3ff59c63ca079137e321" => :mavericks
    sha1 "a411d2fef9d3bd7074e24c7f4340d8228a4bd697" => :mountain_lion
    sha1 "ef10282ef66fa73820cce2db66a8bcecf9e3a949" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'gnutls' => :recommended
  depends_on 'jpeg-turbo'
  depends_on 'gettext'
  depends_on 'fltk'
  depends_on :x11

  def install
    gettext = Formula.factory('gettext')
    turbo   = Formula.factory('jpeg-turbo')
    args = std_cmake_args + %W[
      -DJPEG_INCLUDE_DIR=#{turbo.include}
      -DJPEG_LIBRARY=#{turbo.lib}/libjpeg.dylib
      -DCMAKE_PREFIX_PATH=#{gettext.prefix}
      .
    ]
    system 'cmake', *args
    system 'make install'
  end
end
