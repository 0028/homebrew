require 'formula'

class Libbluray < Formula
  homepage 'http://www.videolan.org/developers/libbluray.html'
  url 'ftp://ftp.videolan.org/pub/videolan/libbluray/0.5.0/libbluray-0.5.0.tar.bz2'
  sha1 '1a9c61daefc31438f9165e7681c563d0524b2d3e'

  bottle do
    cellar :any
    sha1 "7b069feafe4a95547cf6a965740ca563546c127c" => :mavericks
    sha1 "c9be414ed271a6b0766378de2e56ed0c4c74a099" => :mountain_lion
    sha1 "9e0687bd8323a100374b2072bf41f622c3098a5a" => :lion
  end

  head do
    url 'git://git.videolan.org/libbluray.git'

    depends_on :automake => :build
    depends_on :autoconf => :build
    depends_on :libtool  => :build
  end

  depends_on 'pkg-config' => :build
  depends_on :freetype => :recommended

  def install
    ENV.append_to_cflags '-D_DARWIN_C_SOURCE'
    ENV.libxml2

    args = %W[--prefix=#{prefix} --disable-dependency-tracking]
    args << "--without-freetype" if build.without? "freetype"

    system "./bootstrap" if build.head?
    system "./configure", *args
    system "make"
    system "make install"
  end
end
