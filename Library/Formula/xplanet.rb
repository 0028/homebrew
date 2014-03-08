require 'formula'

class Xplanet < Formula
  homepage 'http://xplanet.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/xplanet/xplanet/1.3.0/xplanet-1.3.0.tar.gz'
  sha1 '7c5208b501b441a0184cbb334a5658d0309d7dac'

  bottle do
    sha1 "ff5c262fc5655384ec7a29747b37f402f3fe2a33" => :mavericks
    sha1 "e03d8b3032cd4f6a588bb3f10a8d7ee98aeeae4b" => :mountain_lion
    sha1 "98d7cca84c7feea67b910eabeb41c8597f4f8093" => :lion
  end

  option "with-x", "Build for X11 instead of Aqua"
  option "complete", "Installs the additional dependencies included as part Xplanet's default configuration"

  depends_on 'pkg-config' => :build
  depends_on 'libpng'
  depends_on 'jpeg'
  depends_on 'giflib'
  depends_on 'libtiff'
  depends_on :x11

  if build.include? 'complete'
    depends_on 'netpbm'
    depends_on 'freetype'
    depends_on 'pango'
  end

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]
    if build.with? "x"
      args << "--with-x"
    else
      args << "--with-aqua" << "--without-x"
    end

    if build.include? "complete"
      pnm = Formula["netpbm"].opt_prefix
      ENV.append 'CPPFLAGS', "-I#{pnm}/include/netpbm"
      ENV.append 'LDFLAGS', "-L#{pnm}/lib"
    end

    system "./configure", *args
    system "make install"
  end
end
