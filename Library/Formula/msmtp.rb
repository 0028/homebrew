require 'formula'

class Msmtp < Formula
  homepage 'http://msmtp.sourceforge.net'
  url 'https://downloads.sourceforge.net/project/msmtp/msmtp/1.4.32/msmtp-1.4.32.tar.bz2'
  sha1 '03186a70035dbbf7a31272a20676b96936599704'

  bottle do
    sha1 "18f5bceafcd5c0c832f81d08c54f6f248207ebac" => :mavericks
    sha1 "5f5d6f11ccb2dd42a50a9dc6076cc0dec4c873c7" => :mountain_lion
    sha1 "b98f2b9d07c18556fb4c48027eff991c4a22f290" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'curl-ca-bundle' => :optional

  # msmtp enables OS X Keychain support by default, so no need to ask for it.

  def install
    # Msmtp will build against gnutls by default if it exists on the
    # system.  This sets up problems if the user later removes gnutls.
    # So explicitly ask for openssl, and ye shall receive it whether
    # or not gnutls is present.
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-ssl=openssl
    ]

    system "./configure", *args
    system "make", "install"
  end
end
