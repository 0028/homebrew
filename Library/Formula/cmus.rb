require 'formula'

class Cmus < Formula
  homepage 'http://cmus.sourceforge.net/'
  url 'http://downloads.sourceforge.net/cmus/cmus-v2.5.0.tar.bz2'
  sha1 '244975a5ff642567acb047f6bd518e4a3271c25b'

  head 'https://git.gitorious.org/cmus/cmus.git'

  bottle do
    sha1 'a5c1a7d19c3e0f7018da3a5fab75245cb3552bf8' => :mavericks
    sha1 '846fe10d7d8591d731944faf6a569d841f30b6dd' => :mountain_lion
    sha1 'e609320bad8c5c567595adb7068a8eff0e89fb6e' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'libao'
  depends_on 'mad'
  depends_on 'libogg'
  depends_on 'libvorbis'
  depends_on 'faad2'
  depends_on 'flac'
  depends_on 'mp4v2'
  depends_on 'libcue'
  depends_on 'ffmpeg' => :optional

  def install
    system "./configure", "prefix=#{prefix}", "mandir=#{man}"
    system "make install"
  end
end
