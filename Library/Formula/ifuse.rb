require 'formula'

class Ifuse < Formula
  homepage 'http://www.libimobiledevice.org/'
  url 'http://www.libimobiledevice.org/downloads/ifuse-1.1.2.tar.bz2'
  sha1 '885d88b45edb85c38b0ce9863f0d45fd378b5614'

  bottle do
    cellar :any
    sha1 "a9055ee4ba04cd37b84ecafed0523eaa5ff7df07" => :mavericks
    sha1 "14b283212c5bddf2656e4adf673050677ac5fe0b" => :mountain_lion
    sha1 "1e5de119d30d148eef3342163987142ef7d4fbbf" => :lion
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
  depends_on 'osxfuse'

  def install
    system "./autogen.sh" if build.head?

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def caveats
    <<-EOS.undent
      Make sure to follow the directions given by `brew info osxfuse`
      before trying to use a FUSE-based filesystem.
    EOS
  end
end
