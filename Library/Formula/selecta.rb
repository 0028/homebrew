require "formula"

class Selecta < Formula
  homepage "https://github.com/garybernhardt/selecta"
  url "https://github.com/garybernhardt/selecta/archive/v0.0.1.tar.gz"
  sha1 "7528a7b817ffa428759b12533e3382b5e7482603"

  bottle do
    cellar :any
    sha1 "e5662b4d82b169d9c728e25ed5dcc6126da1e30d" => :mavericks
    sha1 "74528b18dbf9c639a161c555a78a9b55a0129277" => :mountain_lion
    sha1 "1756c4dc32d83ddd3ef002dd7e1f9c162e168fa9" => :lion
  end

  def install
    bin.install 'selecta'
  end
end
