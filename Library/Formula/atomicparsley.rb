require 'formula'

class Atomicparsley < Formula
  homepage 'http://bitbucket.org/wez/atomicparsley/overview/'
  url 'https://bitbucket.org/dinkypumpkin/atomicparsley/downloads/atomicparsley-0.9.6.tar.bz2'
  sha1 'ab5a4c5c477cd6cdb6e3b5f35dc24fd49e6b6b20'

  bottle do
    cellar :any
    sha1 "0838e008610e43365cc7a14b32071056eb8ff5f2" => :mavericks
    sha1 "6709c67f8e1d5c5666f17433f2ddce980280e882" => :mountain_lion
    sha1 "dddea611daacafe4f3d52e47f6ace12b70a9af46" => :lion
  end

  head 'https://bitbucket.org/wez/atomicparsley', :using => :hg

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--disable-universal"
    system "make install"
  end
end
