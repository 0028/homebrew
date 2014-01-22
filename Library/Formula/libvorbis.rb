require 'formula'

class Libvorbis < Formula
  homepage 'http://vorbis.com'
  url 'http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.4.tar.xz'
  sha1 'b99724acdf3577982b3146b9430d765995ecf9e1'

  bottle do
    cellar :any
    sha1 "4fd9ca85cdcf26bcac17fd4bc64b0e27d5ecb1f0" => :mavericks
    sha1 "4f0059ea8a92354a92121f98d11f57ee59517150" => :mountain_lion
    sha1 "660bb9411e0f16a4ca937d05949d6447d82bbd59" => :lion
  end

  head do
    url 'http://svn.xiph.org/trunk/vorbis'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  option :universal

  depends_on 'pkg-config' => :build
  depends_on 'libogg'

  def install
    ENV.universal_binary if build.universal?

    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
