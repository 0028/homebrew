require 'formula'

# NOTE: Configure will fail if using awk 20110810 from dupes.
# Upstream issue: https://savannah.gnu.org/bugs/index.php?37063

class Wget < Formula
  homepage 'http://www.gnu.org/software/wget/'
  url 'http://ftpmirror.gnu.org/wget/wget-1.14.tar.gz'
  bottle do
    sha1 '5bb8506be1f3511cb73969a5dd799620c047570b' => :mavericks
    sha1 'd1b82bdbb0020d32f812452926e1992db574e62a' => :mountain_lion
    sha1 'bc4a2528a9297d9ca9439038ffee89b2fbc7038a' => :lion
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
