require 'formula'

class Nmap < Formula
  homepage 'http://nmap.org/'
  head 'https://guest:@svn.nmap.org/nmap/', :using => :svn
  url 'http://nmap.org/dist/nmap-6.40.tar.bz2'
  sha1 'ee1bec1bb62045c7c1fc69ff183b2ae9b97bd0eb'

  bottle do
    sha1 "d8af2a607b7b5c82f0ee473926775b1c35189e6f" => :mavericks
    sha1 "fd02109bc86c32e1ca894c9b863b6911c28d80af" => :mountain_lion
    sha1 "c4b59e3015dba87ceeb0013d5e1ef46c0b6a199d" => :lion
  end

  depends_on "openssl"

  conflicts_with 'ndiff', :because => 'both install `ndiff` binaries'

  fails_with :llvm do
    build 2334
  end

  def install
    ENV.deparallelize

    args = %W[
      --prefix=#{prefix}
      --with-libpcre=included
      --with-liblua=included
      --with-openssl=#{Formula.factory("openssl").prefix}
      --without-nmap-update
      --without-zenmap
      --disable-universal
    ]

    system "./configure", *args
    system "make" # separate steps required otherwise the build fails
    system "make install"
  end

  test do
    system "#{bin}/nmap", '-p80,443', 'google.com'
  end
end
