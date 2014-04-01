require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.8.tar.gz'
  sha256 '1e815613a9e87dde97245312885d347cd3f65ba064710bafaa05607c005e50b2'

  bottle do
    cellar :any
    sha1 "93de7177615afc4cd808906e6b51d080c834c97d" => :mavericks
    sha1 "93f472f865614e6e93a3297d29722193c32e490f" => :mountain_lion
    sha1 "c06948db228c7db7d58451473d5176b40876a81d" => :lion
  end

  depends_on 'asciidoc'
  depends_on 'xmlto'

  def install
    ENV['XML_CATALOG_FILES'] = "#{etc}/xml/catalog"
    system "make"
    tools = %w{reposurgeon repopuller repodiffer}
    bin.install tools
    man1.install tools.map { |m| "#{m}.1" }
  end
end
