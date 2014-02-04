require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.2.tar.gz'
  sha256 'e190b5a3de5fa8cceeb70e51518c2b201b10d2e6e8bc2287a8fb59e843c60106'

  bottle do
    cellar :any
    sha1 "78a1d679f01939427ebc9af017f0cb97cff1fdc7" => :mavericks
    sha1 "b3e2d6a63422a5a1b16c7a5082520b18f3ee1650" => :mountain_lion
    sha1 "86ee8852e3c986c25a84f4e484f037aae6e98dc0" => :lion
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
