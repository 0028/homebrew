require 'formula'

class Reposurgeon < Formula
  homepage 'http://www.catb.org/esr/reposurgeon/'
  url 'http://www.catb.org/~esr/reposurgeon/reposurgeon-3.1.tar.gz'
  sha256 '34f6ca25ce9ebab477661294dcde943e70621bafb523a0cb28a8b551bb6a532f'

  bottle do
    cellar :any
    sha1 "8138fe3e06d33f85296d0b68bbfc8590a8be8d92" => :mavericks
    sha1 "816e4713aa118d2c3bb5bf1d25d1f56ccc5730a6" => :mountain_lion
    sha1 "4290bf0e966da85dac1153aef99266411293686a" => :lion
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
