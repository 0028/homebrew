require 'formula'

class Ngircd < Formula
  homepage 'http://ngircd.barton.de'
  url 'http://ngircd.barton.de/pub/ngircd/ngircd-21.tar.gz'
  bottle do
    sha1 "d3ba56aff071fa52b672a823444267d5c2a44c5b" => :mavericks
    sha1 "cd69d3a6674a494e51f184ad09f7cc14611c5349" => :mountain_lion
    sha1 "b2493d141eba98c9f5e1c0f92001b15aa9d9869b" => :lion
  end

  mirror 'http://ngircd.mirror.3rz.org/pub/ngircd/ngircd-21.tar.gz'
  sha256 '0edbd41304186e43f9d907a7017b40520cc90c2ce29b1339bdcd7622fffe19a0'

  option 'with-iconv', 'Enable character conversion using libiconv.'
  option 'with-pam', 'Enable user authentication using PAM.'

  # Older Formula used the next option by default, so keep it unless
  # deactivated by the user:
  option 'without-ident', 'Disable "IDENT" ("AUTH") protocol support.'

  depends_on 'libident' if build.with? 'ident'

  def install
    args =%W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-ipv6
      --with-openssl
    ]

    args << "--with-iconv" if build.with? "iconv"
    args << "--with-ident" if build.with? "ident"
    args << "--with-pam" if build.with? "pam"

    system "./configure", *args
    system "make install"
  end
end
