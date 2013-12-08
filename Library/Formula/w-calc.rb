require 'formula'

class WCalc < Formula
  url 'http://downloads.sourceforge.net/w-calc/wcalc-2.4.1.tar.bz2'
  bottle do
    cellar :any
    sha1 '2bd866eee63b0f5d1fd270618af69d542d19b644' => :mavericks
    sha1 'd7f5da3b89af78e2b044ee0d030bc7c749ef6abb' => :mountain_lion
    sha1 'd41521addd3b7dce8063d10e119ea8b9c664ebaf' => :lion
  end

  homepage 'http://w-calc.sourceforge.net'
  sha1 'e3ba04dcfc60a47b60c79fc6f9f4a8fa750ee5f9'

  depends_on 'gmp'
  depends_on 'mpfr'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

end
