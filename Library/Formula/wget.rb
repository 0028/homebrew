require 'formula'

# NOTE: Configure will fail if using awk 20110810 from dupes.
# Upstream issue: https://savannah.gnu.org/bugs/index.php?37063

class Wget < Formula
  homepage 'http://www.gnu.org/software/wget/'
  url 'http://ftpmirror.gnu.org/wget/wget-1.15.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz'
  sha1 'f3c925f19dfe5ed386daae4f339175c108c50574'

  bottle do
    revision 1
    sha1 "e02f56b78e9a75868d1bc1e76e7bef8cb63a837c" => :mavericks
    sha1 "497f75a442d9633a9b414e64fea9860825ae24f8" => :mountain_lion
    sha1 "30278fb38fc4cc5cda37bd6c117204e084d50f84" => :lion
  end

  head do
    url 'git://git.savannah.gnu.org/wget.git'

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "xz" => :build
    depends_on "gettext"
  end

  option "enable-iri", "Enable iri support"
  option "enable-debug", "Build with debug support"

  depends_on "openssl"
  depends_on "libidn" if build.include? "enable-iri"

  def install
    system "./bootstrap" if build.head?

    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --with-ssl=openssl
      --with-libssl-prefix=#{Formula["openssl"].opt_prefix}
    ]

    args << "--disable-debug" unless build.include? "enable-debug"
    args << "--disable-iri" unless build.include? "enable-iri"

    system "./configure", *args
    system "make install"
  end

  test do
    system "#{bin}/wget", "-O", "-", "www.google.com"
  end
end
