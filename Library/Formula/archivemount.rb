require 'formula'

class Archivemount < Formula
  homepage 'http://www.cybernoia.de/software/archivemount.html'
  url 'http://www.cybernoia.de/software/archivemount/archivemount-0.8.3.tar.gz'
  sha1 '8dbe4681fec3f4bbd69801204480192ad4f3f836'
  head 'http://cybernoia.de/software/archivemount/git'

  bottle do
    cellar :any
    sha1 '01bb88ef003bc3050e218cec61366f5c61350b6b' => :mavericks
    sha1 'adae76d89ebc8dd5caf9b67f7b715e6d76c2f14e' => :mountain_lion
    sha1 'ce6a8efb57c2e2a739b56b75a347622f49a2de4d' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'
  depends_on 'libarchive'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    system "archivemount", "--version"
  end
end
