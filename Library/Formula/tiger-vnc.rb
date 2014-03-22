require 'formula'

class TigerVnc < Formula
  homepage 'http://tigervnc.org/'
  url 'https://downloads.sourceforge.net/project/tigervnc/tigervnc/1.3.1/tigervnc-1.3.1.tar.gz'
  sha1 '308ec9a9a627d20406eebfaeac4f3d4398278cc1'
  bottle do
    sha1 "52c90b66cef1afcc4c5cc1796bb63e0263cbfa08" => :mavericks
    sha1 "a0fa2e290350f4e80511330d705f84d3fceca6f7" => :mountain_lion
    sha1 "e94201de7da25690f5f10235fe75cfdd24fa86c9" => :lion
  end

  revision 1

  depends_on 'cmake' => :build
  depends_on 'gnutls' => :recommended
  depends_on 'jpeg-turbo'
  depends_on 'gettext'
  depends_on 'fltk'
  depends_on :x11

  def install
    gettext = Formula['gettext']
    turbo = Formula['jpeg-turbo']
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
