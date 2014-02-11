require 'formula'

class Gd < Formula
  homepage 'http://libgd.bitbucket.org/'
  url 'http://fossies.org/linux/www/libgd-2.1.0.tar.gz'
  sha1 'a0f3053724403aef9e126f4aa5c662573e5836cd'

  bottle do
    cellar :any
    sha1 "87629b4f61bced513cbaaad16326645125ee066c" => :mavericks
    sha1 "9dea4b361b7781b5230c0e58f19e2e45a47bf06d" => :mountain_lion
    sha1 "34383a0f20b5ca9d92fd633ca1d639a411dad565" => :lion
  end

  head 'https://bitbucket.org/libgd/gd-libgd', :using => :hg

  option :universal

  depends_on :libpng => :recommended
  depends_on 'jpeg' => :recommended
  depends_on :freetype => :optional
  depends_on 'libtiff' => :optional
  depends_on 'libvpx' => :optional

  fails_with :llvm do
    build 2326
    cause "Undefined symbols when linking"
  end

  def png_prefix
    MacOS.version >= :mountain_lion ? HOMEBREW_PREFIX/"opt/libpng" : MacOS::X11.prefix
  end

  def freetype_prefix
    MacOS.version >= :mountain_lion ? HOMEBREW_PREFIX/"opt/freetype" : MacOS::X11.prefix
  end

  def install
    ENV.universal_binary if build.universal?
    args = %W{--disable-dependency-tracking --prefix=#{prefix}}

    if build.with? "libpng"
      args << "--with-png=#{png_prefix}"
    else
      args << "--without-png"
    end

    if build.with? "freetype"
      args << "--with-freetype=#{freetype_prefix}"
    else
      args << "--without-freetype"
    end

    if build.with? "jpeg"
      args << "--with-jpeg=#{Formula.factory("jpeg").opt_prefix}"
    else
      args << "--without-jpeg"
    end

    if build.with? "libtiff"
      args << "--with-tiff=#{Formula.factory("libtiff").opt_prefix}"
    else
      args << "--without-tiff"
    end

    if build.with? "libvpx"
      args << "--with-vpx=#{Formula.factory("libvpx").opt_prefix}"
    else
      args << "--without-vpx"
    end

    system "./configure", *args
    system "make install"
  end

  test do
    system "#{bin}/pngtogd", "/usr/share/doc/cups/images/cups.png", "gd_test.gd"
    system "#{bin}/gdtopng", "gd_test.gd", "gd_test.png"
  end
end
