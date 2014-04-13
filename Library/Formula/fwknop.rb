require 'formula'

class Fwknop < Formula
  homepage 'http://www.cipherdyne.org/fwknop/'
  head 'https://github.com/mrash/fwknop.git'
  url 'https://github.com/mrash/fwknop/archive/2.6.1.tar.gz'
  sha1 'f0bb89358262431cc4319223d582a24277a12dad'

  bottle do
    sha1 "06d8eb2c014d7bd1eb53846e613b7a911aaafa5b" => :mavericks
    sha1 "d22e2e6127b7b32a48fb14779e0d1a56541e4784" => :mountain_lion
    sha1 "fb913f311af13d733e5a5077d2c1478d4c907f3c" => :lion
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

  test do
    system "#{bin}/fwknop", "--version"
  end
end
