require 'formula'

class Ifuse < Formula
  homepage 'http://www.libimobiledevice.org/'
  url 'http://www.libimobiledevice.org/downloads/ifuse-1.1.2.tar.bz2'
  sha1 '885d88b45edb85c38b0ce9863f0d45fd378b5614'

  bottle do
    cellar :any
    sha1 "3f9cdd411dd98934ed29c883ac2071670559cc3c" => :mavericks
    sha1 "f952b1dd012f1f31777f1fe09fa51a6c3d6a2ea3" => :mountain_lion
    sha1 "9752b91ccca0e604367f91557bf5acda3c24806f" => :lion
  end

  head do
    url 'http://cgit.sukimashita.com/ifuse.git'

    depends_on 'autoconf' => :build
    depends_on 'automake' => :build
    depends_on 'libtool' => :build
  end

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'libimobiledevice'
  depends_on 'fuse4x'

  def install
    system "./autogen.sh" if build.head?

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
