require 'formula'

class Lynx < Formula
  homepage 'http://lynx.isc.org/release/'
  url 'http://lynx.isc.org/release/lynx2.8.7.tar.bz2'
  sha1 'a34978f7f83cd46bd857cb957faa5a9120458afa'

  bottle do
    sha1 "857044fd386a915c9d7c910d0e5c68fdd7b4cf70" => :mavericks
    sha1 "5925f8a23f19481fb4f8a3430c18bba3517cb10d" => :mountain_lion
    sha1 "8688ca86715b08b322a997741b3cea7784521376" => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--disable-echo",
                          "--enable-default-colors",
                          "--with-zlib",
                          "--with-bzlib",
                          "--with-ssl=#{MacOS.sdk_path}/usr",
                          "--enable-ipv6"
    system "make install"
  end

  test do
    system "#{bin}/lynx", '-dump', 'http://checkip.dyndns.org'
  end
end
