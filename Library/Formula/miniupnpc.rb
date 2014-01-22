require 'formula'

class Miniupnpc < Formula
  homepage 'http://miniupnp.tuxfamily.org'
  url 'http://miniupnp.tuxfamily.org/files/download.php?file=miniupnpc-1.8.20131007.tar.gz'
  sha1 'e2881e9583e90d6706abe0663330f46579efc64a'

  bottle do
    cellar :any
    sha1 "900a73a13ac00b3520d39b146f9ef149ad63cbf1" => :mavericks
    sha1 "2819fa87840b209c9ee0c14bb74ef5d31ef3bfdb" => :mountain_lion
    sha1 "7c4defe1563a8a09505838b06e3083846fb1d98b" => :lion
  end

  def install
    # Reported upstream:
    # http://miniupnp.tuxfamily.org/forum/viewtopic.php?t=978
    inreplace 'Makefile', "-Wl,-install_name,$(SONAME)", "-Wl,-install_name,$(INSTALLDIRLIB)/$(SONAME)"
    system "make", "INSTALLPREFIX=#{prefix}", "install"
  end
end
