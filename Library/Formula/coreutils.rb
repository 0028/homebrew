require 'formula'

class Coreutils < Formula
  homepage 'http://www.gnu.org/software/coreutils'
  url 'http://ftpmirror.gnu.org/coreutils/coreutils-8.22.tar.xz'
  bottle do
    cellar :any
    sha1 '53374a8e079091e7dadd9f81f749505a37c9271e' => :mavericks
    sha1 '14bafbe1f7ee0dc67eb880bc3f2ae2fbf54c8757' => :mountain_lion
    sha1 '9f84d26d9e77d596637920905214d4d225c32539' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/coreutils/coreutils-8.22.tar.xz'
  sha256 '5b3e94998152c017e6c75d56b9b994188eb71bf46d4038a642cb9141f6ff1212'

  conflicts_with 'ganglia', :because => 'both install `gstat` binaries'
  conflicts_with 'idutils', :because => 'both install `gid` and `gid.1`'

  depends_on 'xz' => :build

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--program-prefix=g",
                          "--without-gmp"
    system "make install"

    # Symlink all commands into libexec/gnubin without the 'g' prefix
    coreutils_filenames(bin).each do |cmd|
      (libexec/'gnubin').install_symlink bin/"g#{cmd}" => cmd
    end
    # Symlink all man(1) pages into libexec/gnuman without the 'g' prefix
    coreutils_filenames(man1).each do |cmd|
      (libexec/'gnuman'/'man1').install_symlink man1/"g#{cmd}" => cmd
    end
  end

  def caveats; <<-EOS.undent
    All commands have been installed with the prefix 'g'.

    If you really need to use these commands with their normal names, you
    can add a "gnubin" directory to your PATH from your bashrc like:

        PATH="#{opt_prefix}/libexec/gnubin:$PATH"

    Additionally, you can access their man pages with normal names if you add
    the "gnuman" directory to your MANPATH from your bashrc as well:

        MANPATH="#{opt_prefix}/libexec/gnuman:$MANPATH"

    EOS
  end

  def coreutils_filenames (dir)
    filenames = []
    dir.find do |path|
      next if path.directory? or path.basename.to_s == '.DS_Store'
      filenames << path.basename.to_s.sub(/^g/,'')
    end
    filenames.sort
  end
end
