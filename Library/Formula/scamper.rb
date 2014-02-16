require 'formula'

class Scamper < Formula
  homepage 'http://www.caida.org/tools/measurement/scamper/'
  url 'http://www.caida.org/tools/measurement/scamper/code/scamper-cvs-20140122.tar.gz'
  sha1 'a9ede92a49d8e3433cb909a1467a51320d35c5af'

  bottle do
    cellar :any
    sha1 "ee0874b89098b3f147e6ecaa42537ef385e3c84f" => :mavericks
    sha1 "72b25445927629ec95d19b3d2d103698752f13b0" => :mountain_lion
    sha1 "7cb759cbafbea4a670d4ebede8b1f8953d9ad051" => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
