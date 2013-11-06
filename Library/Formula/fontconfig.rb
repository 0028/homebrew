require 'formula'

class Fontconfig < Formula
  homepage 'http://fontconfig.org/'
  url 'http://fontconfig.org/release/fontconfig-2.10.95.tar.bz2'
  sha1 'f9f4a25b730a9c56f951db6fec639ddeeb92a9d4'

  bottle do
    sha1 'fe9ea7cf87a3f442571a93fda6ed539f74b5ecea' => :mavericks
    sha1 '5ed39070bb5b0d7316d14567e0b952725fec4e58' => :mountain_lion
    sha1 '2cf129f0b1f4403f7c3f38ba6ea7c41b38177d17' => :lion
  end

  keg_only :provided_pre_mountain_lion

  option :universal

  depends_on :freetype
  depends_on 'pkg-config' => :build

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--with-add-fonts=/Library/Fonts,~/Library/Fonts",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
