require "formula"

class Mongroup < Formula
  homepage "https://github.com/jgallen23/mongroup"
  url "https://github.com/jgallen23/mongroup/archive/0.4.0.tar.gz"
  sha1 "b6472e325016353afaac04528e3226dc80401e95"

  bottle do
    cellar :any
    sha1 "f8ae5eba6b2a5c30c6e6d859ed28e44073e77201" => :mavericks
    sha1 "999f229537082f97e5e63142dfcccc5722ed1bf0" => :mountain_lion
    sha1 "cde4f5e80f94a94a1b9a930c9e90855bac1cb309" => :lion
  end

  depends_on "mon"

  def install
    bin.mkpath
    system "make", "install", "PREFIX=#{prefix}"
  end

  def test
    system "#{bin}/mongroup", "-V"
  end
end
