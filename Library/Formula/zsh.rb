require 'formula'

class Zsh < Formula
  homepage 'http://www.zsh.org/'
  url 'http://downloads.sourceforge.net/project/zsh/zsh/5.0.2/zsh-5.0.2.tar.bz2'
  sha1 '9f55ecaaae7cdc1495f91237ba2ec087777a4ad9'

  bottle do
    sha1 'aea507d75517ded9439408054bf008c503b625a5' => :mavericks
    sha1 '8347809eb9a66ba3caa6df91d60725de3b2ada54' => :mountain_lion
    sha1 '27e981d32a222da426233e603e37566aa16700af' => :lion
  end

  depends_on 'gdbm'
  depends_on 'pcre'

  option 'enable-etcdir', 'Enable the reading of Zsh rc files in /etc'

  def install
    args = %W[
      --prefix=#{prefix}
      --enable-fndir=#{share}/zsh/functions
      --enable-scriptdir=#{share}/zsh/scripts
      --enable-site-fndir=#{HOMEBREW_PREFIX}/share/zsh/site-functions
      --enable-site-scriptdir=#{HOMEBREW_PREFIX}/share/zsh/site-scripts
      --enable-cap
      --enable-maildir-support
      --enable-multibyte
      --enable-pcre
      --enable-zsh-secure-free
      --with-tcsetpgrp
    ]

    if build.include? 'enable-etcdir'
      args << '--enable-etcdir'
    else
      args << '--disable-etcdir'
    end

    system "./configure", *args

    # Do not version installation directories.
    inreplace ["Makefile", "Src/Makefile"],
      "$(libdir)/$(tzsh)/$(VERSION)", "$(libdir)"

    system "make install"
  end

  def test
    system "#{bin}/zsh", "--version"
  end

  def caveats; <<-EOS.undent
    To use this build of Zsh as your login shell, add it to /etc/shells.

    Add the following to your zshrc to access the online help:
      unalias run-help
      autoload run-help
      HELPDIR=#{HOMEBREW_PREFIX}/share/zsh/helpfiles
    EOS
  end
end
