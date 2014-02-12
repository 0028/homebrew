require "formula"

class Histo < Formula
  homepage "https://github.com/visionmedia/histo"
  url "https://github.com/visionmedia/histo/archive/0.0.2.tar.gz"
  sha1 "0eec89b51716cb8a91cf9088590909fdf340662c"
  head "https://github.com/visionmedia/histo.git"

  bottle do
    cellar :any
    sha1 "0b0f06ee1b2e274824b65b7be1d56aff341572a6" => :mavericks
    sha1 "84eec4e03c9d963c2be6e0ef5dd8c605c688cbfc" => :mountain_lion
    sha1 "a334bd6ac6d1bc4e8182c0d5f59e5ec75718fbc0" => :lion
  end

  def install
    system "make"
    bin.install 'histo'
  end
end
