require "formula"

class Atpdec < Formula
  homepage "http://atpdec.sourceforge.net"
  url "https://downloads.sourceforge.net/project/atpdec/atpdec%20sources/1.7/atpdec-1.7.tar.gz"
  sha1 "161f357cd9f521a3a24d316f88a823453510a196"

  bottle do
    cellar :any
    sha1 "ecefd78bd21261f0af1e1647960567c4fae52cb6" => :mavericks
    sha1 "798ec5e2fb180df6fb0bd7efbe271c93e7e41cc2" => :mountain_lion
    sha1 "d613bb6d84d870364e1618ac0e9c02ce3cb39730" => :lion
  end

  depends_on "libsndfile"
  depends_on "libpng"

  def install
    system "make"
    bin.install "atpdec"
  end

  test do
    system "atpdec"
  end
end
