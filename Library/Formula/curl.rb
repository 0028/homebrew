require 'formula'

class Curl < Formula
  homepage 'http://curl.haxx.se/'
  url 'http://curl.haxx.se/download/curl-7.34.0.tar.gz'
  bottle do
    cellar :any
    sha1 '5c0f2b2623ea1c2799c2efd32c49a1126d6e36bf' => :mavericks
    sha1 '778044d0c1859b232ae2f7891faeebb0e1904203' => :mountain_lion
    sha1 'da722f85a94e3ccf6fe1fbe831313c3f33c66ea2' => :lion
  end

  mirror 'ftp://ftp.sunet.se/pub/www/utilities/curl/curl-7.34.0.tar.gz'
  sha256 '0705271de8411a85460706e177cd0f1064ec07c0b9e140a66a916fb644696d6a'

  keg_only :provided_by_osx

  option 'with-ssh', 'Build with scp and sftp support'
  option 'with-ares', 'Build with C-Ares async DNS support'
  option 'with-ssl', 'Build with Homebrew OpenSSL instead of the system version'
  option 'with-darwinssl', 'Build with Secure Transport for SSL support'
  option 'with-gssapi', 'Build with GSSAPI/Kerberos authentication support.'

  depends_on 'pkg-config' => :build
  depends_on 'libmetalink' => :optional
  depends_on 'libssh2' if build.with? 'ssh'
  depends_on 'c-ares' if build.with? 'ares'
  depends_on 'openssl' if build.with? 'ssl'

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    args << "--with-libssh2" if build.with? 'ssh'
    args << "--with-libmetalink" if build.with? 'libmetalink'
    args << "--enable-ares=#{Formula.factory("c-ares").opt_prefix}" if build.with? 'ares'
    args << "--with-ssl=#{Formula.factory("openssl").opt_prefix}" if build.with? 'ssl'
    args << "--with-darwinssl" if build.with? 'darwinssl'
    args << "--with-gssapi" if build.with? 'gssapi'

    system "./configure", *args
    system "make install"
  end
end
