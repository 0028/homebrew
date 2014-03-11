require "formula"

class Modules < Formula
  homepage "http://modules.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/modules/Modules/modules-3.2.10/modules-3.2.10.tar.bz2"
  sha1 "beb67a228ad890206ac776981269a7287cfb7596"

  bottle do
    sha1 "6653b999292b57c34e2ce5d882c0106d60e86aaf" => :mavericks
    sha1 "4e944901ed5285014fa764b20fb488f293c8134e" => :mountain_lion
    sha1 "2e3e52162ce9a0e2318f0ad1b7cb3d74a4eeb7ee" => :lion
  end

  depends_on :x11 => :optional

  def install
    # -DUSE_INTERP_ERRORLINE fixes
    # error: no member named 'errorLine' in 'struct Tcl_Interp'
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --datarootdir=#{share}
      --disable-versioning
      CPPFLAGS=-DUSE_INTERP_ERRORLINE]
    args << "--without-x" if build.without? "x11"
    system "./configure", *args
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    To activate modules, add the following at the end of your .zshrc:
      source #{opt_prefix}/Modules/init/zsh
    You will also need to reload your .zshrc:
      source ~/.zshrc
    EOS
  end

  test do
    system *%W[#{prefix}/Modules/bin/modulecmd --version]
    system "zsh", "-c", "source #{prefix}/Modules/init/zsh; module"
  end
end
