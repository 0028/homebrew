require 'formula'

class Zebra < Formula
  homepage 'http://www.indexdata.com/zebra'
  url 'http://ftp.indexdata.dk/pub/zebra/idzebra-2.0.58.tar.gz'
  sha1 'c810949e57d86d536ca36145afe6d4f21a04bb61'

  bottle do
    sha1 "802b8c4e642d8e9b2d5b667febc76b4800a52dee" => :mavericks
    sha1 "9c722c0a3fc66b3958a7e9596015e3ad49d9ded5" => :mountain_lion
    sha1 "7a6975aa2d0aa1082ff8c1e6e44a3829728224dd" => :lion
  end

  depends_on 'yaz'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-mod-text",
                          "--enable-mod-grs-regx",
                          "--enable-mod-grs-marc",
                          "--enable-mod-grs-xml",
                          "--enable-mod-dom",
                          "--enable-mod-alvis",
                          "--enable-mod-safari"
    system "make install"
  end
end
