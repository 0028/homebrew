require 'formula'

class Lynx < Formula
  homepage 'http://lynx.isc.org/release/'
  url 'http://lynx.isc.org/release/lynx2.8.7.tar.bz2'
  sha1 'a34978f7f83cd46bd857cb957faa5a9120458afa'

  bottle do
    sha1 'fa34b05973d3a914bb3252fba1aa79c89429d038' => :mavericks
    sha1 'bd0597dc04927894fcf6b2308dcf2daf7ad1c72d' => :mountain_lion
    sha1 '7468f547b922e0a045f1e0ce9121450dcbc1ec96' => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--disable-echo",
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
