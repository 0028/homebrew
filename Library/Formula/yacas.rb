require 'formula'

class Yacas < Formula
  homepage 'http://yacas.sourceforge.net'
  url 'http://yacas.sourceforge.net/backups/yacas-1.3.3.tar.gz'
  sha1 '749952102f5321d62788be8ae459c1a67078b33d'

  bottle do
    sha1 '1b8da9db16c54b2c71614fbdaaa1af3dd06f9f98' => :mavericks
    sha1 'c710a30a2e83d822baefa313cde2eed60bf96ca2' => :mountain_lion
    sha1 '8bb13e7b06b35f9a0b2a068e9579b10ca755d3b1' => :lion
  end

  option "with-server", "Build the network server version"

  def install
    args = [ "--prefix=#{prefix}" ]
    args << "--enable-server" if build.with? "server"

    system "./configure", *args
    system "make install"
  end
end
