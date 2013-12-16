require 'formula'

class Zsh < Formula
  homepage 'http://www.zsh.org/'
  url 'http://fossies.org/linux/misc/zsh-5.0.3.tar.bz2'
  bottle do
    sha1 'd0db34c4c6cf6f02165945fe44d5a9727d581b6c' => :mavericks
    sha1 'fe616e889cd491f3c5dfffdfb3499d82cc1e66c3' => :mountain_lion
    sha1 'b5e37212110fe2a5f73ea903e752f6f28a912bd2' => :lion
  end

  mirror 'http://www.zsh.org/pub/zsh-5.0.3.tar.bz2'
  sha1 'b7a80d2cdb83a871d869cfdf487bda8a18e01ef7'

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
