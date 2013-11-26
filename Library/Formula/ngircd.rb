require 'formula'

class Ngircd < Formula
  homepage 'http://ngircd.barton.de'
  url 'ftp://ftp.berlios.de/pub/ngircd/ngircd-21.tar.gz'
  bottle do
    sha1 'f49358b0eb4da8f6814cacdfceda82569707c980' => :mavericks
    sha1 'afbafb206a6b8617b8c1c7449e328f6ffdd645b6' => :mountain_lion
    sha1 'd150f7abce590badb5a4dc97d0055d52df707fc3' => :lion
  end

  mirror 'http://ngircd.barton.de/pub/ngircd/ngircd-21.tar.gz'
  sha256 '0edbd41304186e43f9d907a7017b40520cc90c2ce29b1339bdcd7622fffe19a0'

  depends_on 'libident'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-ident",
                          "--with-openssl",
                          "--enable-ipv6"
    system "make install"
  end
end
