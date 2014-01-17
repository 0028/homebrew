require 'formula'

class E2fsprogs < Formula
  homepage 'http://e2fsprogs.sourceforge.net/'
  url 'http://downloads.sourceforge.net/e2fsprogs/e2fsprogs-1.42.9.tar.gz'
  sha1 'fb8e3662302bcab1682d567d6ee0ff051faa1bbd'

  head 'https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git'

  bottle do
    sha1 '33f603f5a0d897f8fb04a734c4c14e09b45abd59' => :mavericks
    sha1 '235e8311b544864be7d79184f322d51434443e29' => :mountain_lion
    sha1 '111a55a2969e95784d70fc3f3d6d7ec787c70ee4' => :lion
  end

  keg_only "This brew installs several commands which override OS X-provided file system commands."

  depends_on 'pkg-config' => :build
  depends_on 'gettext'

  # MacPorts patch to compile libs correctly.
  # Fix a bare return for clang.
  def patches
    {:p0 => [
      "https://trac.macports.org/export/92117/trunk/dports/sysutils/e2fsprogs/files/patch-lib__Makefile.darwin-lib"
    ]}
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-e2initrd-helper"
    system "make"
    system "make install"
    system "make install-libs"
  end
end
