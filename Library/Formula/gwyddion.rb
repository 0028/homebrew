require 'formula'

class Gwyddion < Formula
  homepage 'http://gwyddion.net/'
  url 'https://downloads.sourceforge.net/project/gwyddion/gwyddion/2.36/gwyddion-2.36.tar.xz'
  sha1 '0e81bbc3dbb0aadf5ab2ecb0606bd79a12681be2'

  bottle do
    sha1 "4085b57c31e84cedaae19e4458ca6d6cad68326d" => :mavericks
    sha1 "bbfa08f6667f4de7dd055c6a71a6e8fb83a941db" => :mountain_lion
    sha1 "d82c5573231a1242d31412e94ee4977d896b9a94" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'gtk+'
  depends_on 'libxml2'
  depends_on 'fftw'
  depends_on 'gtkglext'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-desktop-file-update",
                          "--prefix=#{prefix}",
                          "--with-html-dir=#{doc}"
    system "make install"
  end
end
