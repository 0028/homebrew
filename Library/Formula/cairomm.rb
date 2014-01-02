require 'formula'

class Cairomm < Formula
  homepage 'http://cairographics.org/cairomm/'
  url 'http://cairographics.org/releases/cairomm-1.10.0.tar.gz'
  sha256 '068d96c43eae7b0a3d98648cbfc6fbd16acc385858e9ba6d37b5a47e4dba398f'

  option 'without-x', 'Build without X11 support'
  option :cxx11

  depends_on 'pkg-config' => :build
  depends_on 'libsigc++' => build.cxx11? ? ['c++11'] : []
  depends_on 'cairo'
  depends_on :x11 unless build.include? 'without-x'

  def install
    ENV.cxx11 if build.cxx11?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
