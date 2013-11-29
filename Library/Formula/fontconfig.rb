require 'formula'

class Fontconfig < Formula
  homepage 'http://fontconfig.org/'
  url 'http://fontconfig.org/release/fontconfig-2.11.0.tar.bz2'
  sha1 '969818b0326ac08241b11cbeaa4f203699f9b550'

  bottle do
    revision 1
    sha1 'a702fca16e4211bb33daa1fa262dc7e974a69a2b' => :mavericks
    sha1 'baee9d8d31c2fb526f82175f2d81b86dbe498196' => :mountain_lion
    sha1 '15574f5ad636e64bcee2a2c5bc4884a0c67f899b' => :lion
  end

  keg_only :provided_pre_mountain_lion

  option :universal

  depends_on :freetype
  depends_on 'pkg-config' => :build

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--with-add-fonts=/System/Library/Fonts,/Library/Fonts,~/Library/Fonts",
                          "--prefix=#{prefix}",
                          "--localstatedir=#{var}",
                          "--sysconfdir=#{etc}"
    system "make install"
  end

  def post_install
    system "#{bin}/fc-cache", "-frv"
  end
end
