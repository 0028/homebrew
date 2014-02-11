require 'formula'

class Markdown < Formula
  homepage 'http://daringfireball.net/projects/markdown/'
  url 'http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip'
  sha1 '7e6d1d9224f16fec5631bf6bc5147f1e64715a4b'

  bottle do
    cellar :any
    sha1 "08b13a82981a672944ebe0432c40b11504c04b05" => :mavericks
    sha1 "9aa7cab2cb849f44a305987f5827e2a1a3f2192c" => :mountain_lion
    sha1 "011b6ddf210a5f8938cf48fbc6520d615a0876bf" => :lion
  end

  conflicts_with 'discount',
    :because => 'both markdown and discount ship a `markdown` executable.'

  def install
    bin.install 'Markdown.pl' => 'markdown'
  end

  test do
    IO.popen("#{bin}/markdown", "w+") do |pipe|
      pipe.write "foo *bar*\n"
      pipe.close_write
      assert_equal "<p>foo <em>bar</em></p>\n", pipe.read
    end
  end
end
