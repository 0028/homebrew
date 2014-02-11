require 'formula'

class Zsh < Formula
  homepage 'http://www.zsh.org/'
  url 'http://downloads.sourceforge.net/project/zsh/zsh/5.0.5/zsh-5.0.5.tar.bz2'
  bottle do
    sha1 "aebd0b92085f06d64ed2ed16c4c0bdb1d21c1355" => :mavericks
    sha1 "da8d0b5cd883b703e00345fe00def7e4de88a51a" => :mountain_lion
    sha1 "bac17b51ee9055072f5484b77d861ebcd645f3fb" => :lion
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

    system "make install"

    if ENV['HOMEBREW_KEEP_INFO']
      system "make install.info"
    end
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
