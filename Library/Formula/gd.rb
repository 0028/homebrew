require 'formula'

class Gd < Formula
  homepage 'http://libgd.bitbucket.org/'
  url 'https://bitbucket.org/libgd/gd-libgd/downloads/libgd-2.1.0.tar.gz'
  sha1 'a0f3053724403aef9e126f4aa5c662573e5836cd'

  bottle do
    cellar :any
    sha1 "367275a1b49bcd46956ef2157b2f44cdf5788ae5" => :mavericks
    sha1 "5b39ec9a13176cbf3f2999439a0294c92a482750" => :mountain_lion
    sha1 "0f25174a0a74aabcc687ac7aa85b863f83ce498a" => :lion
  end

  head 'https://bitbucket.org/libgd/gd-libgd', :using => :hg

  option :universal

  depends_on :libpng => :recommended
  depends_on 'jpeg' => :recommended
  depends_on :fontconfig => :optional
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

  def fontconfig_prefix
    MacOS.version >= :mountain_lion ? HOMEBREW_PREFIX/"opt/fontconfig" : MacOS::X11.prefix
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

    if build.with? "fontconfig"
      args << "--with-fontconfig=#{fontconfig_prefix}"
    else
      args << "--without-fontconfig"
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
