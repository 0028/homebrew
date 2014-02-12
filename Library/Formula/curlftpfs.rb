require 'formula'

class Curlftpfs < Formula
  homepage 'http://curlftpfs.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/curlftpfs/curlftpfs/0.9.2/curlftpfs-0.9.2.tar.gz'
  sha1 '83f148afe6bd4d44c9790790f1c30986c8b9ea56'

  head 'https://github.com/rfw/curlftpfs.git'

  bottle do
    cellar :any
    sha1 "3dc73aff8a474fd4d5f6b73e068239e5f769f633" => :mavericks
    sha1 "b8e2425187e8965e391ddbc95a3bcbfb1b8c12d2" => :mountain_lion
    sha1 "b420c2bab8a5d090e8b0eb1545ae0fa1f5834fe5" => :lion
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
end
