require 'formula'

class Liboauth < Formula
  homepage 'http://liboauth.sourceforge.net'
  url 'https://downloads.sourceforge.net/project/liboauth/liboauth-1.0.3.tar.gz'
  sha1 '791dbb4166b5d2c843c8ff48ac17284cc0884af2'

  bottle do
    cellar :any
    sha1 "d21f7cf65dfb3dea80d1070e9b56a5d41e1ee494" => :mavericks
    sha1 "565008028062c99b030f1d9109ee13f6982669bd" => :mountain_lion
    sha1 "41db11ae314b35b712a88e1cd438ca8ae4184b41" => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-curl"
    system "make install"
  end
end
