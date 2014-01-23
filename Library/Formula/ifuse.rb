require 'formula'

class Ifuse < Formula
  homepage 'http://www.libimobiledevice.org/'
  url 'http://www.libimobiledevice.org/downloads/ifuse-1.1.2.tar.bz2'
  sha1 '885d88b45edb85c38b0ce9863f0d45fd378b5614'

  bottle do
    cellar :any
    sha1 "6de01ffcb2cded792bd759db22aff695de2066e0" => :mavericks
    sha1 "a24258766013e152139f59f46fac160a58435742" => :mountain_lion
    sha1 "0d9aef7b18518df86f2169256dc23df246c3c476" => :lion
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

  def caveats
    <<-EOS.undent
      Make sure to follow the directions given by `brew info fuse4x`
      before trying to use a FUSE-based filesystem.
    EOS
  end
end
