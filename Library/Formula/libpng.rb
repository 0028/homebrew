require 'formula'

class Libpng < Formula
  homepage 'http://www.libpng.org/pub/png/libpng.html'
  url 'https://downloads.sf.net/project/libpng/libpng15/1.5.18/libpng-1.5.18.tar.bz2'
  sha1 '52fee0139ff96c98a6a0ef6375845ca366a33c94'

  bottle do
    cellar :any
    sha1 "2b2d8eb191f8594258a53b8d0b806d344f2422db" => :mavericks
    sha1 "d201d4795bcb3b09981e481ce5235813e45bb4fe" => :mountain_lion
    sha1 "342448c83cef71c98f66ba068271129acab204fc" => :lion
  end

  keg_only :provided_pre_mountain_lion

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
