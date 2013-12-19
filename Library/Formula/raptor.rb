require 'formula'

class Raptor < Formula
  homepage 'http://librdf.org/raptor/'
  url 'http://download.librdf.org/source/raptor2-2.0.12.tar.gz'
  sha1 'd485d409e93b79a9d3690ba2b9d15ca6e1c4b84e'

  bottle do
    cellar :any
    sha1 '3c134829b69d924a3c078be80b6cb1b2f65f9101' => :mavericks
    sha1 '648e8481c2baa06aeff4018ad30bccf4176d7d9e' => :mountain_lion
    sha1 '6d70a544db5bea933451bf687e1e546aae4a86bf' => :lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
