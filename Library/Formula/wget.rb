require 'formula'

# NOTE: Configure will fail if using awk 20110810 from dupes.
# Upstream issue: https://savannah.gnu.org/bugs/index.php?37063

class Wget < Formula
  homepage 'http://www.gnu.org/software/wget/'
  url 'http://ftpmirror.gnu.org/wget/wget-1.14.tar.gz'
  bottle do
    sha1 '87552a5299b9f474c708c83b9732f8a7aa5154cb' => :mavericks
    sha1 '7711e8c34d855760de4e4a33fb28c4f0c0aa69d9' => :mountain_lion
    sha1 '4174252e4d0e588ffe7b17863408883a8f141b88' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/wget/wget-1.14.tar.gz'
  sha1 'c487bce740b3a1847a35fb29b5c6700c46f639b8'

  head do
    url 'git://git.savannah.gnu.org/wget.git'

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "xz" => :build
    depends_on "gettext"
  end

  option "enable-iri", "Enable iri support"
  option "enable-debug", "Build with debug support"

  depends_on "openssl" if MacOS.version <= :leopard
  depends_on "libidn" if build.include? "enable-iri"

  def install
    system "./bootstrap" if build.head?
    args = ["--prefix=#{prefix}",
            "--sysconfdir=#{etc}",
            "--with-ssl=openssl"]
    args << "--disable-debug" unless build.include? "enable-debug"
    args << "--disable-iri" unless build.include? "enable-iri"

    system "./configure", *args
    system "make install"
  end

  def test
    system "#{bin}/wget", "-O", "-", "www.google.com"
  end
end
