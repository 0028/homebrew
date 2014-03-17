require 'formula'

class GitCola < Formula
  homepage 'http://git-cola.github.io/'
  url 'https://github.com/git-cola/git-cola/archive/v2.0.1.tar.gz'
  sha1 '5e6fd0ac4cf4161332bec8257b31bb7a3f041494'

  head 'https://github.com/git-cola/git-cola.git'

  bottle do
    cellar :any
    sha1 "1f7d2ffeedc2c3f8038a06ecd371381b216c828b" => :mavericks
    sha1 "f013804d0a12ea985a02cee3189cfcb60c9f8bba" => :mountain_lion
    sha1 "203f08460576b6a68f339f8c596fd70775e861be" => :lion
  end

  option 'with-docs', "Build man pages using asciidoc and xmlto"

  depends_on 'pyqt'

  if build.with? "docs"
    # these are needed to build man pages
    depends_on 'asciidoc'
    depends_on 'xmlto'
  end

  def install
    system "make", "prefix=#{prefix}", "install"

    if build.with? "docs"
      system "make", "-C", "share/doc/git-cola",
                     "-f", "Makefile.asciidoc",
                     "prefix=#{prefix}",
                     "install", "install-html"
    end
  end

end
