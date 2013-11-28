require 'formula'

class Libmaxminddb < Formula
  homepage 'https://github.com/maxmind/libmaxminddb'
  url 'https://github.com/maxmind/libmaxminddb/releases/download/0.5.2/libmaxminddb-0.5.2.tar.gz'
  sha1 'db7618a97c222cab0a0ba2fb8439abcd1465f10c'
  head 'https://github.com/maxmind/libmaxminddb.git'

  bottle do
    cellar :any
    sha1 '7d0e8b80fe88c7db1a062b0c45842e8850542e7f' => :mavericks
    sha1 'f51e5cedd0bc71f3dff63a4f1344f980057fbf29' => :mountain_lion
    sha1 'dc15a02d1d36081693ebff7deb9945ff10cc7907' => :lion
  end

  if build.head?
    depends_on 'autoconf' => :build
    depends_on 'automake' => :build
    depends_on 'libtool' => :build
  end
  depends_on 'geoipupdate' => :optional

  option :universal

  def install
    ENV.universal_binary if build.universal?

    system "./bootstrap" if build.head?

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "check"
    system "make", "install"
  end

  test do
    system "curl", "-O", "http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz"
    system "gunzip", "GeoLite2-Country.mmdb.gz"
    system "#{bin}/mmdblookup", "-f", "GeoLite2-Country.mmdb",
                                "-i", "8.8.8.8"
  end
end
