require 'formula'

class Libupnp < Formula
  homepage 'http://pupnp.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%201.6.19/libupnp-1.6.19.tar.bz2'
  sha1 'ee9e16ff42808521b62b7fc664fc9cba479ede88'

  bottle do
    cellar :any
    sha1 '5331f83b88cfeebaa8de807cd102fecc03699ccf' => :mavericks
    sha1 '1b28b3a7228a30ed9236f3f3c20bd459efeb7f11' => :mountain_lion
    sha1 '8a7c6b48b6b68ba22d820a352983dc114bc70f8a' => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
