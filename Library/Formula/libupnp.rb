require 'formula'

class Libupnp < Formula
  homepage 'http://pupnp.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%201.6.19/libupnp-1.6.19.tar.bz2'
  sha1 'ee9e16ff42808521b62b7fc664fc9cba479ede88'

  bottle do
    cellar :any
    sha1 'da3d701a68a71a79201014634b06c624b3c53a9c' => :mavericks
    sha1 'f44e3cdb098fc8501d95a4a2964e69578d88840c' => :mountain_lion
    sha1 'fc0a94635975055d817a28ddb253bd47092509c0' => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
