require 'formula'

class Watchman < Formula
  homepage 'https://github.com/facebook/watchman'
  head 'https://github.com/facebook/watchman.git'
  url 'https://github.com/facebook/watchman/archive/v2.9.6.tar.gz'
  sha1 '415e0f2547205c7507e520bc40dc8cca3e06a40a'

  bottle do
    cellar :any
    sha1 "8cc66d5cb46721821930b286183a85cda37cdb5e" => :mavericks
    sha1 "6e36adff071b627efea29ffb26bf8456293debf7" => :mountain_lion
    sha1 "370646b6e2dfa8cdc8044553d141592d68935bad" => :lion
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
