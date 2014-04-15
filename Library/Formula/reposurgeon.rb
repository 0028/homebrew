require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.9.tar.gz'
  sha256 'b1bd242e9db9ac8c34b2569694bbc9dca83d526f7509b1751106dbeef074abd8'

  bottle do
    cellar :any
    sha1 "7939f3bdbd6d07b54a440b9e073a2b3b377158f9" => :mavericks
    sha1 "da53f0fd29a39bded0ad2a4bb8cee17e6bc8e228" => :mountain_lion
    sha1 "c58c5b1d4d152a4394c026484dcbd9752fd50ffb" => :lion
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
