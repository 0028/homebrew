require 'formula'

class Regldg < Formula
  homepage 'http://regldg.com'
  url 'http://regldg.com/regldg-1.0.0.tar.gz'
  sha1 '1a355c1898f90b6a725e2ddc39b4daa2ce83b856'

  bottle do
    cellar :any
    sha1 'a905b510c3f0733b9b363356d20fad7d50524faa' => :mavericks
    sha1 '7e9b1ac375b190e73ab333dea82ef9de43c1ba7b' => :mountain_lion
    sha1 '6f5c3e41685bc4dbaea0f22e52fac344ba489bc1' => :lion
  end

  def install
    system "make"
    bin.install('regldg')
  end

  test do
    system "#{bin}/regldg", "test"
  end
end
