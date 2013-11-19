require 'formula'

class Log4cplus < Formula
  homepage 'http://log4cplus.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/1.1.2/log4cplus-1.1.2.tar.bz2'
  sha1 '39caf65f9aaaed3698dcc239a2fa26f1f90952c9'

  bottle do
    cellar :any
    sha1 '46e92629e4a0875ed4797b54471716b20a51c0af' => :mavericks
    sha1 '7ff95d6f394ca37ed3c1c00a533c0d0c7c1ed525' => :mountain_lion
    sha1 'af34b27ee08efa2993b2d50f7847d877d8370c4e' => :lion
  end

  option :cxx11

  def install
    ENV.cxx11 if build.cxx11?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
