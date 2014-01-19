require 'formula'

# NOTE: Configure will fail if using awk 20110810 from dupes.
# Upstream issue: https://savannah.gnu.org/bugs/index.php?37063

class Wget < Formula
  homepage 'http://www.gnu.org/software/wget/'
  url 'http://ftpmirror.gnu.org/wget/wget-1.15.tar.gz'
  bottle do
    sha1 "7907e7b047f3303e9040b7ab03ef348e2a6ef978" => :mavericks
    sha1 "26ddb6c9c04dc57e9d1b43199302fcf4a7b79bcc" => :mountain_lion
    sha1 "e81415d96bec673625b0de1bbd927472edac5879" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz'
  sha1 'f3c925f19dfe5ed386daae4f339175c108c50574'

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
