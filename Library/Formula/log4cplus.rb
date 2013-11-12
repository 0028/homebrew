require 'formula'

class Log4cplus < Formula
  homepage 'http://log4cplus.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/1.1.1/log4cplus-1.1.1.tar.bz2'
  sha1 '3a86b2e124091c9345ee1bac81ca1fb3773fad60'

  bottle do
    sha1 'c21581b380d91cc0ed65b531154bc1e9338b41d6' => :mavericks
    sha1 'df0d372e40aacd42f521f2eb697960706be6924e' => :mountain_lion
    sha1 'b19749f6176302af6394a78be6952c6a1eba41fb' => :lion
  end

  option :cxx11

  def install
    ENV.cxx11 if build.cxx11?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
