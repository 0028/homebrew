require 'formula'

class Lightning < Formula
  homepage 'http://www.gnu.org/software/lightning/'
  url 'http://ftpmirror.gnu.org/lightning/lightning-2.0.3.tar.gz'
  bottle do
    cellar :any
    sha1 'cf48ce7bd42722349a84eca0d70f534ec7cc2eb7' => :mavericks
    sha1 '97863bebe700d1232b1084942cc38fbfa043354c' => :mountain_lion
    sha1 'f57531c396e59a2a9df82752d6831945b48d9c00' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/lightning/lightning-2.0.3.tar.gz'
  sha1 'b774b62b1470368bc5886234b7228d7058352484'

  def install
    system "./configure","--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
