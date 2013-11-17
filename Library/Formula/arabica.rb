require 'formula'

class Arabica < Formula
  homepage 'http://www.jezuk.co.uk/cgi-bin/view/arabica'
  url 'http://downloads.sourceforge.net/project/arabica/arabica/November-12/arabica-2012-November.tar.gz'
  version '20121126'
  sha1 '34d043607e048e0972a57e31bfff09086d893d14'

  bottle do
    cellar :any
    sha1 'c8cd5af97f7e6081fa3588ac97779750e22dbd39' => :mavericks
    sha1 '4ac37f18fb3ea748665138458daf246e33800287' => :mountain_lion
    sha1 'c837bf4e20f7c511aa9f276734c5295a2af24057' => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
