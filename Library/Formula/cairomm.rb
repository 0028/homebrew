require 'formula'

class Cairomm < Formula
  homepage 'http://cairographics.org/cairomm/'
  url 'http://cairographics.org/releases/cairomm-1.10.0.tar.gz'
  sha256 '068d96c43eae7b0a3d98648cbfc6fbd16acc385858e9ba6d37b5a47e4dba398f'

  bottle do
    sha1 'e9cb495d3c6e4d9e54ecd3464c9a4f1abd9ea0b5' => :mavericks
    sha1 '79426340d092f3a47d39914c47a0481ba7119dba' => :mountain_lion
    sha1 'e81e46bd6129d7a81baf51533d9273655bf02dd2' => :lion
  end

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
