require 'formula'

class Watchman < Formula
  homepage 'https://github.com/facebook/watchman'
  head 'https://github.com/facebook/watchman.git'
  url 'https://github.com/facebook/watchman/archive/v2.9.3.tar.gz'
  sha1 '6647e36105b18b99b03eb009d13d8decc91e1898'

  bottle do
    cellar :any
    sha1 '89d12a8ccca43aa4008f5c46a6a428aded64defa' => :mavericks
    sha1 '58b90add59982ba5c27f0c075f399d2428f91c73' => :mountain_lion
    sha1 'f8a813359dbab09e0d378985c2d355d8f2f808e4' => :lion
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
