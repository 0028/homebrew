require 'formula'

class GitCola < Formula
  homepage 'http://git-cola.github.io/'
  url 'https://github.com/git-cola/git-cola/archive/v1.9.3.tar.gz'
  sha1 'f180befabef2b7286953b4b760eea8e306613fd4'

  head 'https://github.com/git-cola/git-cola.git'

  bottle do
    cellar :any
    sha1 '6ff7b05934877929d8d34126b8350a3e0fd3eba6' => :mavericks
    sha1 '23fc439f92a6ca90209c7d4059bcb682f35e4fd3' => :mountain_lion
    sha1 '488d40a15c8d11c5d1663d1b2503a2a5b5997e4d' => :lion
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
