require 'formula'

class GlibNetworking < Formula
  homepage 'https://launchpad.net/glib-networking'
  url 'http://ftp.gnome.org/pub/GNOME/sources/glib-networking/2.38/glib-networking-2.38.2.tar.xz'
  sha256 'e8e2fe919d3236169c9bfaec807966ec81b844fc28b11bddc9f8256cfa949fc7'

  bottle do
    cellar :any
    sha1 '3b2b3684a4cad8df94cbb5d3473426f1a5f04826' => :mavericks
    sha1 'cad909b6f8d6092662993eef3d8f9462deba17c2' => :mountain_lion
    sha1 '3469234ecd7fe123f968cb8cb92b30e7e2013f62' => :lion
  end

  option "curl-ca-bundle", "Build with cURL's CA certificate"

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'gnutls'
  depends_on 'gsettings-desktop-schemas'
  depends_on 'curl-ca-bundle' => :optional

  def install
    if build.with? "curl-ca-bundle"
      curl_ca_bundle = Formula.factory('curl-ca-bundle').opt_prefix
      certs_options = "--with-ca-certificates=#{curl_ca_bundle}/share/ca-bundle.crt"
    else
      certs_options = "--without-ca-certificates"
    end

    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          certs_options
    system "make install"
  end
end
