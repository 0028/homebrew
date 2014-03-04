require 'formula'

class Openfst < Formula
  homepage 'http://www.openfst.org/'
  url 'http://openfst.cs.nyu.edu/twiki/pub/FST/FstDownload/openfst-1.3.4.tar.gz'
  sha1 '21972c05896b2154a3fa1bdca5c9a56350194b38'

  bottle do
    cellar :any
    sha1 "d9d6a56473867141bfc9665c2d6a30b05ecd4b87" => :mavericks
    sha1 "d9ca5f02bfb57a06d01cc3f6ce8f2c64dfcbbed0" => :mountain_lion
    sha1 "5edb5ee7160618e9377d597f2e54962ab25b7a7d" => :lion
  end

  def install
    ENV.libstdcxx if ENV.compiler == :clang && MacOS.version >= :mavericks
    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          "--enable-far",
                          "--enable-pdt"
    system "make install"
  end
end
