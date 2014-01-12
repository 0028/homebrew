require 'formula'

class Curl < Formula
  homepage 'http://curl.haxx.se/'
  url 'http://curl.haxx.se/download/curl-7.34.0.tar.gz'
  bottle do
    cellar :any
    sha1 '1e17275e1a23ecf0ca7f9551d008e7c4c0a3c2c5' => :mavericks
    sha1 '0e556ccb13800f8dd5b3a21b214a2290a1aeedd0' => :mountain_lion
    sha1 '6e48645789ee39d6dbbb8eac44ab0bffb1633f46' => :lion
  end

  mirror 'ftp://ftp.sunet.se/pub/www/utilities/curl/curl-7.34.0.tar.gz'
  sha256 '0705271de8411a85460706e177cd0f1064ec07c0b9e140a66a916fb644696d6a'

  keg_only :provided_by_osx

  option 'with-ssh', 'Build with scp and sftp support'
  option 'with-ares', 'Build with C-Ares async DNS support'
  option 'with-gssapi', 'Build with GSSAPI/Kerberos authentication support.'

  if MacOS.version >= :mountain_lion
    option 'with-openssl', 'Build with OpenSSL instead of Secure Transport'
    depends_on 'openssl' => :optional
  else
    depends_on 'openssl'
  end

  depends_on 'pkg-config' => :build
  depends_on 'libmetalink' => :optional
  depends_on 'libssh2' if build.with? 'ssh'
  depends_on 'c-ares' if build.with? 'ares'

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    if MacOS.version < :mountain_lion or build.with? "openssl"
      args << "--with-ssl=#{Formula.factory("openssl").opt_prefix}"
    else
      args << "--with-darwinssl"
    end

    args << "--with-libssh2" if build.with? 'ssh'
    args << "--with-libmetalink" if build.with? 'libmetalink'
    args << "--enable-ares=#{Formula.factory("c-ares").opt_prefix}" if build.with? 'ares'
    args << "--with-gssapi" if build.with? 'gssapi'

    system "./configure", *args
    system "make install"
  end
end
