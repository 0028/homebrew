require 'formula'

class Afflib < Formula
  homepage 'https://github.com/simsong/AFFLIBv3'
  url 'https://github.com/simsong/AFFLIBv3/archive/v3.7.4.tar.gz'
  sha1 '589dae6f8439e97ab080026701cd0caa0636ac22'

  bottle do
    cellar :any
    sha1 'faa3777b0e4c6776f69e303429fb5306fb5e8dfa' => :mavericks
    sha1 '114fa84a9c4d3190a057d78edba5f0deb38e1416' => :mountain_lion
    sha1 'dd9aaaeba77ca0206da4cda851fa315d288741e5' => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'expat' => :optional

  def install
    system "sh bootstrap.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
