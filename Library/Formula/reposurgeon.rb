require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.3.tar.gz'
  sha256 '6808aa5195a6f808d1f36eb6e81514a8379f2324e2e33e86520cbd5a6017b3e9'

  bottle do
    cellar :any
    sha1 "c421f81b731ea70a5c8ea956d4c347e2b9eed7d8" => :mavericks
    sha1 "500883f637605b65e9cf3e3d77865bdfe43224c5" => :mountain_lion
    sha1 "210b4c89dc72ea40bf11115c946771dc11819d7c" => :lion
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
