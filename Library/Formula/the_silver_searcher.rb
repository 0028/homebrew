require 'formula'

class TheSilverSearcher < Formula
  homepage 'https://github.com/ggreer/the_silver_searcher'
  head 'https://github.com/ggreer/the_silver_searcher.git'
  url 'https://github.com/ggreer/the_silver_searcher/archive/0.19.2.tar.gz'
  sha1 '5154cc825366044ccba5652d803ef98caad70ff7'

  bottle do
    cellar :any
    sha1 "cc9929be1eb749a018f787346b2f5323b5f563bb" => :mavericks
    sha1 "4cf4e2685127d8355adbc3e3dd76e4586773d11e" => :mountain_lion
    sha1 "b68329a8edff0e8085ca7401c3b8e15c3f6017a7" => :lion
  end

  depends_on :automake
  depends_on :autoconf

  depends_on 'pkg-config' => :build
  depends_on 'pcre'
  depends_on 'xz'

  def install
    # Stable tarball does not include pre-generated configure script
    system "aclocal -I #{HOMEBREW_PREFIX}/share/aclocal"
    system "autoconf"
    system "autoheader"
    system "automake --add-missing"

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"

    bash_completion.install 'ag.bashcomp.sh'
  end

  def test
    system "#{bin}/ag", "--version"
  end
end
