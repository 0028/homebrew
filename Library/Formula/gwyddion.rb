require 'formula'

class Gwyddion < Formula
  homepage 'http://gwyddion.net/'
  url 'https://downloads.sourceforge.net/project/gwyddion/gwyddion/2.35/gwyddion-2.35.tar.xz'
  sha1 'c58027bdedfc5615bac134b2178197869c52c950'

  bottle do
    sha1 "3a3c8589fece795c4446be3144c2a7cb37de5a56" => :mavericks
    sha1 "5eb1785efecc466ca5ea3afd20f3b7b34b2375d0" => :mountain_lion
    sha1 "ed8b2d2b9595df7ccf3bb0895cfa99abbdace9e6" => :lion
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
