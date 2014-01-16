require 'formula'

class Imlib2 < Formula
  homepage 'http://sourceforge.net/projects/enlightenment/files/'
  url 'http://downloads.sourceforge.net/project/enlightenment/imlib2-src/1.4.6/imlib2-1.4.6.tar.bz2'
  sha1 '20e111d822074593e8d657ecf8aafe504e9e2967'

  bottle do
    sha1 '30d79977f7d24295ab9153cde8f73d673e03bd88' => :mavericks
    sha1 'fd06a1dacb9afe48d9eb29746204ae094fc0376f' => :mountain_lion
    sha1 '75fdb8559d5fb807c666b9b8b1f0e3bd0a290e47' => :lion
  end

  option "without-x", "Build without X support"

  depends_on :freetype
  depends_on :libpng => :recommended
  depends_on :x11 if MacOS::X11.installed? or not build.include? "without-x"
  depends_on 'pkg-config' => :build
  depends_on 'jpeg' => :recommended

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-amd64=no
    ]
    args << "--without-x" if build.include? "without-x"

    system "./configure", *args
    system "make install"
  end

  test do
    system "#{bin}/imlib2_conv", "/usr/share/doc/cups/images/cups.png", "imlib2_test.png"
  end
end
