require 'formula'

class Parrot < Formula
  homepage 'http://www.parrot.org/'
  url 'ftp://ftp.parrot.org/pub/parrot/releases/supported/5.9.0/parrot-5.9.0.tar.bz2'
  bottle do
    sha1 '9fb8512c8405af829e0e6cd39f5d806bcd92650f' => :mavericks
    sha1 '8b0e6778363331c89d25d4bbba3303448fe98300' => :mountain_lion
    sha1 'deb7c74e64f3c5f5bd3e3575993acb861e85e8c4' => :lion
  end

  sha256 'b4704231d90ddec827f45f945b9ad13dd4f9dc7cc9bc0cfc97ab6e30ec1c38ca'

  devel do
    url 'ftp://ftp.parrot.org/pub/parrot/releases/devel/5.10.0/parrot-5.10.0.tar.bz2'
    sha256 '6030f72adccdb577a8e781e3d81c52dc60d68c6a9e2be626db3cff69e1f36ce5'
  end

  head 'https://github.com/parrot/parrot.git'

  conflicts_with 'rakudo-star'

  depends_on 'gmp' => :optional
  depends_on 'icu4c' => :optional
  depends_on 'pcre' => :optional
  depends_on 'readline' => :optional
  depends_on 'libffi' => :optional

  def install
    system "perl", "Configure.pl", "--prefix=#{prefix}",
                                   "--mandir=#{man}",
                                   "--debugging=0",
                                   "--cc=#{ENV.cc}"

    system "make"
    system "make install"
    # Don't install this file in HOMEBREW_PREFIX/lib
    rm_rf lib/'VERSION'
  end
end
