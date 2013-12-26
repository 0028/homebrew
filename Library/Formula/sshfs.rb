require 'formula'

class Sshfs < Formula
  homepage 'http://fuse.sourceforge.net/sshfs.html'
  url 'https://github.com/fuse4x/sshfs/archive/sshfs_2_4_0.tar.gz'
  sha1 '30b81ac7f32125088652937568d8886e3bb3f6e2'

  bottle do
    cellar :any
    sha1 '080092e6b18c425c0367ddc5562a47d75baca30d' => :mavericks
    sha1 '323a47a62fa060ce80b2a49c31f3579713572c73' => :mountain_lion
    sha1 '4b6e6242fa7f54108afc6b9e9c68fae67b205884' => :lion
  end

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on :libtool

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'
  depends_on 'glib'
  depends_on :xcode

  def install
    # Compatibility with Automake 1.13 and newer.
    inreplace 'configure.ac', 'AM_CONFIG_HEADER', 'AC_CONFIG_HEADERS'

    system "autoreconf", "--force", "--install"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Make sure to follow the directions given by `brew info fuse4x-kext`
    before trying to use a FUSE-based filesystem.
    EOS
  end
end
