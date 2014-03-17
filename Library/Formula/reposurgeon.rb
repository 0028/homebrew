require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.7.tar.gz'
  sha256 '41730252d74ea0b7beb3171b55a449037d46d4a405ad52cd88c2c7577fe67026'

  bottle do
    cellar :any
    sha1 "dacf9dd737891054791e3dc97611c78a2849da79" => :mavericks
    sha1 "1cad024ef126a7f9b05d7e3f697cc17ce5aad5a6" => :mountain_lion
    sha1 "ccf6b763d58c43240f9e06035f65673864ad1e7f" => :lion
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
