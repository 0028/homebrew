require 'formula'

class MysqlProxy < Formula
  homepage 'http://dev.mysql.com/doc/refman/5.6/en/mysql-proxy.html'
  url 'http://cdn.mysql.com/Downloads/MySQL-Proxy/mysql-proxy-0.8.3.tar.gz'
  sha1 'ce6e03e2bdcafecd06a9c3582096dd4eeacdaaa8'

  bottle do
    sha1 'aed11b52f81a5fc473182c801498848456f99da8' => :mavericks
    sha1 '5dc910ba5bc507f6b8c90e66e818c51330d24668' => :mountain_lion
    sha1 '870d414ad9e717df8319c68245fda53df625191a' => :lion
  end

  depends_on :mysql
  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'libevent'
  depends_on 'lua'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          # Ugh, don't dump these directly into /usr/local/include.
                          # Use a subfolder, please.
                          "--includedir=#{include}/mysqlproxy"
    system "make install"
    # Copy over the example scripts
    (share+"mysqlproxy").install Dir['examples/*.lua']
  end
end
