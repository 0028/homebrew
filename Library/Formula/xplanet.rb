require 'formula'

class Xplanet < Formula
  homepage 'http://xplanet.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/xplanet/xplanet/1.3.0/xplanet-1.3.0.tar.gz'
  sha1 '7c5208b501b441a0184cbb334a5658d0309d7dac'

  bottle do
    sha1 "662807113af4148a7f605dc8350de7bcc39e61c8" => :mavericks
    sha1 "07009a2e03b1bc1cde35383ab31b733f5808aa9b" => :mountain_lion
    sha1 "485e0afb43d6edf8e277c7e8d4a0e1ae94be7d66" => :lion
  end

  option "with-x", "Build for X11 instead of Aqua"
  option "with-all", "Build with default Xplanet configuration dependencies except JPL CSPICE (manual install)"

  depends_on 'pkg-config' => :build
  depends_on "libpng"
  depends_on 'jpeg'
  depends_on 'giflib'
  depends_on 'libtiff'
  depends_on :x11

  if build.with? "all"
    depends_on "cspice"
    depends_on "netpbm"
    depends_on "freetype"
    depends_on "pango"
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

    if build.with? "all"
      netpbm = Formula["netpbm"].opt_prefix
      ENV.append 'CPPFLAGS', "-I#{netpbm}/include/netpbm"
      ENV.append 'LDFLAGS', "-L#{netpbm}/lib"
    end

    system "./configure", *args
    system "make install"
  end
end
