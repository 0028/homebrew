require 'formula'

class Watchman < Formula
  homepage 'https://github.com/facebook/watchman'
  head 'https://github.com/facebook/watchman.git'
  url 'https://github.com/facebook/watchman/archive/v2.9.5.tar.gz'
  sha1 'e8dd863c6239caf1ef2742c0ecbba2b3b9febaaa'

  bottle do
    cellar :any
    sha1 "36390b5a55e998d2e5014593346abb954c1a0521" => :mavericks
    sha1 "749d7aa1627b7d884da3f3672ca7ddaec68905e3" => :mountain_lion
    sha1 "f7f3c759a0a7b999b72c5c38d28ee70d7e80bf11" => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on 'pkg-config' => :build
  depends_on 'pcre'

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-pcre"
    system "make"
    system "make install"
  end

  def caveats; <<-EOS.undent
    To increase file limits add 'kern.maxfiles=10485760' and 'kern.maxfilesperproc=10485760'
    to /etc/sysctl.conf (use 'sysctl -w' to do so immediately).

    See https://github.com/facebook/watchman#max-os-file-descriptor-limits
    EOS
  end
end
