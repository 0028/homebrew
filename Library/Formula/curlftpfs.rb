require 'formula'

class Curlftpfs < Formula
  homepage 'http://curlftpfs.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/curlftpfs/curlftpfs/0.9.2/curlftpfs-0.9.2.tar.gz'
  sha1 '83f148afe6bd4d44c9790790f1c30986c8b9ea56'

  head 'https://github.com/rfw/curlftpfs.git'

  bottle do
    cellar :any
    sha1 "1d634fd67b72ede557dafd98e5c12420832d25b2" => :mavericks
    sha1 "a4eaea9e2546de87ed44f447ac6c55c06f593b8f" => :mountain_lion
    sha1 "4ed6b0bfd9d2266b53b712f07acb54295a98b840" => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  depends_on 'pkg-config' => :build

  depends_on 'osxfuse'
  depends_on 'glib'

  def install
    # Compatibility with Automake 1.13 and newer.
    inreplace 'configure.ac', 'AM_CONFIG_HEADER', 'AC_CONFIG_HEADERS'

    system "autoreconf", "--force", "--install"
    ENV.append 'CPPFLAGS', '-D__off_t=off_t'
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Make sure to follow the directions given by `brew info osxfuse`
    before trying to use a FUSE-based filesystem.
    EOS
  end
end
