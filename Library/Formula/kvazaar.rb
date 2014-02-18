require "formula"

class Kvazaar < Formula
  homepage "https://github.com/ultravideo/kvazaar"
  url "https://github.com/ultravideo/kvazaar/archive/v0.2.4.tar.gz"
  sha1 "636c26955b0b69249f51bc8661a8d57ad4c581df"

  bottle do
    cellar :any
    sha1 "6b71f2cccd3fd6b2d3a86ca53f483be9379ea340" => :mavericks
    sha1 "6f88d633a6ce18b835f128ac5d2237cefe0b98a0" => :mountain_lion
    sha1 "358cd6082d5902b061a256fcb06ddb6630d16ecd" => :lion
  end

  depends_on 'yasm' => :build

  def install
    cd 'src' do
      system 'make'
    end
    bin.install 'src/kvazaar'
  end

  test do
    system "kvazaar 2>&1 | grep 'HEVC Encoder v. 0.2'"
  end
end
