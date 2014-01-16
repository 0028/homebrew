require 'formula'

class Tree < Formula
  homepage 'http://mama.indstate.edu/users/ice/tree/'
  url 'http://mama.indstate.edu/users/ice/tree/src/tree-1.6.0.tgz'
  sha1 '350f851f68859a011668362dd0e7ee81fd1b713a'

  bottle do
    cellar :any
    sha1 'fba24119835b76800eb1c4c8115607db8941d492' => :mavericks
    sha1 'c7fd32b2fdb18bd293ff244f3e3d9db4f3d059a1' => :mountain_lion
    sha1 'ec6f1dfc87fa2d12891be9e890b4a3cb33d7ffc2' => :lion
  end

  def install
    ENV.append 'CFLAGS', '-fomit-frame-pointer'
    objs = 'tree.o unix.o html.o xml.o hash.o color.o strverscmp.o'

    system "make", "prefix=#{prefix}",
                   "MANDIR=#{man1}",
                   "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "LDFLAGS=#{ENV.ldflags}",
                   "OBJS=#{objs}",
                   "install"
  end

  test do
    system "#{bin}/tree", prefix
  end
end
