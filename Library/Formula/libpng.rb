require 'formula'

class Libpng < Formula
  homepage 'http://www.libpng.org/pub/png/libpng.html'
  url 'http://downloads.sf.net/project/libpng/libpng16/1.6.8/libpng-1.6.8.tar.xz'
  sha1 'acdb0a45d80c90b39b56a41075003d4726f3558c'

  bottle do
    cellar :any
    sha1 '666d5ba290d72b0cfa13366232eb0ffcc701d21f' => :mavericks
    sha1 '53a3844f816573e2e05eda169fd2b04bf14a3038' => :mountain_lion
    sha1 '1ab314dd174f3833bda1d0b0b3cb3e3762ece842' => :lion
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
