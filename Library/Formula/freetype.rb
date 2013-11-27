require 'formula'

class Freetype < Formula
  homepage 'http://www.freetype.org'
  url 'http://downloads.sf.net/project/freetype/freetype2/2.5.0/freetype-2.5.0.1.tar.gz'
  sha1 '2d539b375688466a8e7dcc4260ab21003faab08c'

  bottle do
    cellar :any
    sha1 '49604baab2e2efca836b898e2b5c2ec18b7a337b' => :mavericks
    sha1 '911c057fe49ad0b5e9e7c5492a5a64184ff611f9' => :mountain_lion
    sha1 'a7e8c32b48e22880088a8d10a74f7d1b7fc0b84a' => :lion
  end

  keg_only :provided_pre_mountain_lion

  option :universal

  depends_on :libpng

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/freetype-config", '--cflags', '--libs', '--ftversion',
      '--exec-prefix', '--prefix'
  end
end
