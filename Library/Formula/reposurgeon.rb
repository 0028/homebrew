require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.6.tar.gz'
  sha256 'c07354319813095f5db6c416fd491eb8efd4d7c67db7161c88fd2c3afe0d5386'

  bottle do
    cellar :any
    sha1 "16a03797b63724f96062b9411061c7c8b2e732c5" => :mavericks
    sha1 "f2df3c3797c8f24fce3ae017253a49f502dc504b" => :mountain_lion
    sha1 "a05aa6907919a3939436e8d7c846192b690db249" => :lion
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
