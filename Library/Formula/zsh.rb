require 'formula'

class Zsh < Formula
  homepage 'http://www.zsh.org/'
  url 'http://downloads.sourceforge.net/project/zsh/zsh/5.0.5/zsh-5.0.5.tar.bz2'
  bottle do
    sha1 "9db87d89c4edf2a66744a53bb24c29864a27c0b9" => :mavericks
    sha1 "c2508775487b4dac5ee926e6b1604235a91728e1" => :mountain_lion
    sha1 "7987b1bdfcdb24c72b5cf6cc3df328e67fa28085" => :lion
  end

  mirror 'http://www.zsh.org/pub/zsh-5.0.5.tar.bz2'
  sha1 '75426146bce45ee176d9d50b32f1ced78418ae16'

  depends_on 'gdbm'
  depends_on 'pcre'

  option 'disable-etcdir', 'Disable the reading of Zsh rc files in /etc'

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

    if build.include? 'disable-etcdir'
      args << '--disable-etcdir'
    else
      args << '--enable-etcdir=/etc'
    end

    system "./configure", *args

    # Do not version installation directories.
    inreplace ["Makefile", "Src/Makefile"],
      "$(libdir)/$(tzsh)/$(VERSION)", "$(libdir)"

    system "make", "install"
    system "make", "install.info"
  end

  def test
    system "#{bin}/zsh", "--version"
  end

  def caveats; <<-EOS.undent
    Add the following to your zshrc to access the online help:
      unalias run-help
      autoload run-help
      HELPDIR=#{HOMEBREW_PREFIX}/share/zsh/helpfiles
    EOS
  end
end
