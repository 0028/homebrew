require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.4.tar.gz'
  sha256 '1e7ef243963af6b72924e2064f51bb3d5003bb8c2ae036f905ba5cadab3a461e'

  bottle do
    cellar :any
    sha1 "9bfd47fe09913886a191c1c4324d467a078db401" => :mavericks
    sha1 "18acb13e4c447954165d9841c1f70d34eeaaf5df" => :mountain_lion
    sha1 "d6409866cfbb94d85380195bffc95a350d27b55c" => :lion
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
