require 'formula'

class Yacas < Formula
  homepage 'http://yacas.sourceforge.net'
  url 'http://yacas.sourceforge.net/backups/yacas-1.3.3.tar.gz'
  sha1 '749952102f5321d62788be8ae459c1a67078b33d'

  bottle do
    sha1 '0c526ccb623e64326e08cf187f86ac33817c566e' => :mavericks
    sha1 'e9b240c8ff4f232b2570615171c9111561574122' => :mountain_lion
    sha1 'ed5d3eca9bcce67019eda3e73c92ff9aca63bc57' => :lion
  end

  option "with-server", "Build the network server version"

  def install
    args = [ "--prefix=#{prefix}" ]
    args << "--enable-server" if build.with? "server"

    system "./configure", *args
    system "make install"
  end
end
