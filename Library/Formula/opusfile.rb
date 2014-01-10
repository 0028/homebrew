require 'formula'

class Opusfile < Formula
  homepage 'http://www.opus-codec.org/'
  url 'http://downloads.xiph.org/releases/opus/opusfile-0.5.tar.gz'
  sha1 '1ba9dabbbaa35034af8167661a918df6c003317e'

  head 'https://git.xiph.org/opusfile.git'

  bottle do
    cellar :any
    sha1 'e00fb8799bc2badb92013446ae01365b71ce3837' => :mavericks
    sha1 '9ba2f87d086d8cbf12e298c291b806be9f9ad96c' => :mountain_lion
    sha1 'c170d91d29057713939e1daddb04c0704f69ae04' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'opus'
  depends_on 'libogg'

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

end
