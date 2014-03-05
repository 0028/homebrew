require 'formula'

class Libwmf < Formula
  homepage 'http://wvware.sourceforge.net/libwmf.html'
  url 'https://downloads.sourceforge.net/project/wvware/libwmf/0.2.8.4/libwmf-0.2.8.4.tar.gz'
  sha1 '822ab3bd0f5e8f39ad732f2774a8e9f18fc91e89'

  bottle do
    sha1 "6c063b35cac5688dbfd1635105ff5b586219e624" => :mavericks
    sha1 "d147180c3f41acd9272f6ba3b60c85a6dd7727b0" => :mountain_lion
    sha1 "9e5e7e2ca37ad9042ad29cb7c11affd2729abfc6" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'gd'
  depends_on :freetype
  depends_on :libpng

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-png=#{Formula["libpng"].opt_prefix}",
                          "--with-freetype=#{Formula["freetype"].opt_prefix}"
    system "make"
    ENV.j1 # yet another rubbish Makefile
    system "make install"
  end
end
