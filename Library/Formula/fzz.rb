require "formula"

class Fzz < Formula
  homepage "https://github.com/mrnugget/fzz"
  url "https://github.com/mrnugget/fzz/archive/v0.0.1.tar.gz"
  sha1 "70b0326d3c7cbffafb327fa092eeaf647f65ea08"

  bottle do
    sha1 "0a9e5db42c23d22ff98add381621fd9506542f6c" => :mavericks
    sha1 "c0cc0e7131e433fd5c76f19afc6d528e8b17c776" => :mountain_lion
    sha1 "798e7838608e62408439ec6b1418ec7950fb5163" => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'build', '-o', 'fzz'
    bin.install 'fzz'
  end

  test do
    assert_equal "fzz 0.0.1\n", `#{bin}/fzz -v`
  end
end
