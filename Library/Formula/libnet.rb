require 'formula'

class Libnet < Formula
  homepage 'https://github.com/sam-github/libnet'
  url 'http://downloads.sourceforge.net/project/libnet-dev/libnet-1.1.6.tar.gz'
  sha1 'dffff71c325584fdcf99b80567b60f8ad985e34c'

  bottle do
    cellar :any
    sha1 "18228eccdde5cafe8be0fd5279f15eb778ec3eab" => :mavericks
    sha1 "2bb59666d0940f83f6c63b92ec6fc6ddc87b8120" => :mountain_lion
    sha1 "a8906edb6a1da7bb73053b2a3cba253a263d2ad1" => :lion
  end

  # MacPorts does an autoreconf to get raw sockets working
  depends_on :automake
  depends_on :autoconf
  depends_on :libtool

  # Fix raw sockets support
  def patches
    {:p0 =>
     "https://trac.macports.org/export/95336/trunk/dports/net/libnet11/files/patch-configure.in.diff"
    }
  end

  def install
    # Compatibility with Automake 1.13 and newer.
    # Reported upstream:
    # https://github.com/sam-github/libnet/issues/28
    mv 'configure.in', 'configure.ac'
    inreplace 'configure.ac', 'AM_CONFIG_HEADER', 'AC_CONFIG_HEADERS'
    (buildpath/'m4').mkpath

    system "autoreconf --force --install"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    inreplace "src/libnet_link_bpf.c", "#include <net/bpf.h>", "" # Per MacPorts
    system "make install"
  end
end

