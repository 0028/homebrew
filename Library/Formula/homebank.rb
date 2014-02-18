require 'formula'

class Homebank < Formula
  homepage 'http://homebank.free.fr'
  url 'http://homebank.free.fr/public/homebank-4.5.5.tar.gz'
  sha1 '1867c1d1671a3f1ca16f660b8169d5255e440d93'

  bottle do
    sha1 "205136ef953d551d8fe648357fafaefc9dc4129a" => :mavericks
    sha1 "410ad5f4288c492a9ea6a12a388baaadac02d895" => :mountain_lion
    sha1 "b0156a128824b584e1f27d2020ea62013a8dfc5e" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'gtk+'
  depends_on 'hicolor-icon-theme'
  depends_on :freetype
  depends_on :fontconfig
  depends_on 'libofx' => :optional

  def install
    args = ["--disable-dependency-tracking",
            "--prefix=#{prefix}"]
    args << "--with-ofx" if build.with? 'libofx'

    system "./configure", *args
    system "chmod +x ./install-sh"
    system "make install"
  end
end
