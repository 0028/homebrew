require 'formula'

class Csvprintf < Formula
  homepage 'http://code.google.com/p/csvprintf/'
  url 'http://csvprintf.googlecode.com/files/csvprintf-1.0.3.tar.gz'
  sha1 'ee5ee6728a44cc7d0961b0960c7a444372752931'

  bottle do
    sha1 "62052d376507860aa628c134cbf1df70bc4b95a4" => :mavericks
    sha1 "06d388beca76c89aa56f48e35b972e18388c8514" => :mountain_lion
    sha1 "1f125c34d55d2d229e4a3d2896e7430a71965573" => :lion
  end

  def install
    ENV.append 'LDFLAGS', '-liconv'
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    assert_equal "Fred Smith\n", pipe("#{bin}/csvprintf -i '%2$s %1$s\n'", "Last,First\nSmith,Fred\n")
  end
end
