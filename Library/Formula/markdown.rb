require 'formula'

class Markdown < Formula
  homepage 'http://daringfireball.net/projects/markdown/'
  url 'http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip'
  sha1 '7e6d1d9224f16fec5631bf6bc5147f1e64715a4b'

  bottle do
    cellar :any
    sha1 "14f835d74610979f2197f58f464489d1a4ab11f0" => :mavericks
    sha1 "fcfe9a3e6cc1934a4d72f565906d21c1d7ce91a2" => :mountain_lion
    sha1 "68693cf20b561579f0c80e1b323d06e2720cd087" => :lion
  end

  conflicts_with 'discount',
    :because => 'both markdown and discount ship a `markdown` executable.'

  def install
    bin.install 'Markdown.pl' => 'markdown'
  end

  test do
    assert_equal "<p>foo <em>bar</em></p>\n", pipe("#{bin}/markdown", "foo *bar*\n")
  end
end
