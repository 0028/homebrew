require 'formula'

class GitIntegration < Formula
  homepage 'http://johnkeeping.github.io/git-integration/'
  url 'https://github.com/johnkeeping/git-integration/archive/v0.2.zip'
  sha1 'ce86564077a683c8ce270c85530f9100f3f8c950'

  bottle do
    cellar :any
    sha1 '95f0a564ebeb79cb797daad65e2e9443425deac9' => :mavericks
    sha1 '7360c7fe3adbbe6e8ed0aba4f8d1e522ede5afd5' => :mountain_lion
    sha1 'b0c606088f0a85140f1a5578919205e90c252e7b' => :lion
  end

  depends_on 'asciidoc' => [:build, :optional]

  def install
    ENV["XML_CATALOG_FILES"] = "#{HOMEBREW_PREFIX}/etc/xml/catalog"
    (buildpath/"config.mak").write("prefix = #{prefix}")
    system "make", "install"
    if build.include? "with-asciidoc"
      system "make", "install-doc"
    end
    system "make", "install-completion"
  end

  test do
    system "#{bin}/git-integration", "--version"
  end
end
