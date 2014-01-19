require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.0.tar.gz'
  sha256 '358b72670c645b62a122feccebb660d9f3c98544bf1fc4d159b1b44cb2a45107'

  bottle do
    cellar :any
    sha1 '6a7f58a05fd685338f81ad962c64ed15ab03158a' => :mavericks
    sha1 '3996afc77f85b7d03ee2f1df0c02d40813806680' => :mountain_lion
    sha1 '2deb1a027e918e59d9686dd0976a73b4fa6c7ab6' => :lion
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
