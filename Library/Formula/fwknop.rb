require 'formula'

class Fwknop < Formula
  homepage 'http://www.cipherdyne.org/fwknop/'
  head 'https://github.com/mrash/fwknop.git'
  url 'https://github.com/mrash/fwknop/archive/2.6.0.tar.gz'
  sha1 '8e55413823f57e362a8f732da60da6c3c6240a6c'

  bottle do
    sha1 '0ddbedf9073fade00d22a4080e42f66d57304d3c' => :mavericks
    sha1 '6809ec55d4a30d4b6722ac36cb1535734d4e59ba' => :mountain_lion
    sha1 '197f7f377ffb7d07908583b028f85edefb27fd42' => :lion
  end

  depends_on :automake
  depends_on :autoconf
  depends_on :libtool

  depends_on 'gpgme'

  def install
    system './autogen.sh' if build.head? or !File.exist?('configure')
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-gpgme"
    system "make install"
  end

  def test
    system "#{bin}/fwknop", "--version"
  end
end
