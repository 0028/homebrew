require "formula"

class Kvazaar < Formula
  homepage "https://github.com/ultravideo/kvazaar"
  url "https://github.com/ultravideo/kvazaar/archive/v0.3.0.tar.gz"
  sha1 "cd3924a2692d0b3ebaed7f0c88b300ea15155fb1"

  bottle do
    cellar :any
    sha1 "3ccd9d3a3d23133ffcfdab5f19974c1452fedab1" => :mavericks
    sha1 "698116b52299cbbf1f6468392c51732f57bdbf54" => :mountain_lion
    sha1 "9bc8d258f1e40898d617e887f2837a3c80c4a99a" => :lion
  end

  depends_on 'yasm' => :build

  def install
    cd 'src' do
      system 'make'
    end
    bin.install 'src/kvazaar'
  end

  test do
    system "kvazaar 2>&1 | grep 'HEVC Encoder v. 0.3'"
  end
end
