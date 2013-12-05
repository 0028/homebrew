require 'formula'

class GitCola < Formula
  homepage 'http://git-cola.github.io/'
  url 'https://github.com/git-cola/git-cola/archive/v1.9.2.tar.gz'
  sha1 '62becefdfa2b899d123259b9d640ab2090a5062c'

  head 'https://github.com/git-cola/git-cola.git'

  bottle do
    cellar :any
    sha1 '7f22d9591fc12126ed8837a25592b56aaec40e1d' => :mavericks
    sha1 'f2bcf067e3e6c791617e984a1a861df9380f00b6' => :mountain_lion
    sha1 '44e79e1aff7432aedd070f3206d38d51bded6f6e' => :lion
  end

  option 'with-docs', "Build man pages using asciidoc and xmlto"

  depends_on :python
  depends_on 'pyqt'

  if build.include? 'with-docs'
    # these are needed to build man pages
    depends_on 'asciidoc'
    depends_on 'xmlto'
  end

  def install
    python do
      # The python do block creates the PYTHONPATH and temp. site-packages
      system "make", "prefix=#{prefix}", "install"

      if build.include? 'with-docs'
        system "make", "-C", "share/doc/git-cola",
                       "-f", "Makefile.asciidoc",
                       "prefix=#{prefix}",
                       "install", "install-html"
      end
    end
  end

end
