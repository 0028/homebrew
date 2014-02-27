require 'formula'

class Ktoblzcheck < Formula
  homepage 'http://ktoblzcheck.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/ktoblzcheck/ktoblzcheck-1.45.tar.gz'
  sha1 'a552012bb219ac24dcdbac977cf94c951bfe31bc'

  bottle do
    sha1 "6b86a711bc389549cfa69bc3f5458cd7c125ef07" => :mavericks
    sha1 "397fb987b6295e8e9bd9c0c532510923d9e09adf" => :mountain_lion
    sha1 "d459e497fb3fff523468ad84de66ccecd1ca8097" => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    ENV.j1
    system "make install"
  end
end
