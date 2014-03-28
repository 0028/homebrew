require 'formula'

class Wv < Formula
  homepage 'http://wvware.sourceforge.net/'
  url 'http://abisource.com/downloads/wv/1.2.9/wv-1.2.9.tar.gz'
  sha1 'db4717a151742dbdb492318f104504a92075543a'

  bottle do
    sha1 "c80c8b68ed09bdea3f437583666fdb6b0c704772" => :mavericks
    sha1 "e0d2d6b2eea4cf0aaad1dffbc72102a69f39e40d" => :mountain_lion
    sha1 "c881f98fcab13687c717d31ccf63acd974c81b77" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'libgsf'
  depends_on 'libwmf'
  depends_on 'libpng'

  def install
    ENV.libxml2
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make"
    ENV.deparallelize
    # the makefile generated does not create the file structure when installing
    # till it is fixed upstream, create the target directories here.
    system "mkdir -p #{share}"
    system "mkdir -p #{man1}"
    system "mkdir -p #{share}/wv/wingdingfont"
    system "mkdir -p #{share}/wv/patterns"
    system "mkdir -p #{bin}"
    system "mkdir -p #{lib}/pkgconfig"
    system "mkdir -p #{include}/wv"

    system "make install"
  end
end
