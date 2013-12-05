require 'formula'

class Tree < Formula
  homepage 'http://mama.indstate.edu/users/ice/tree/'
  url 'http://mama.indstate.edu/users/ice/tree/src/tree-1.6.0.tgz'
  sha1 '350f851f68859a011668362dd0e7ee81fd1b713a'

  bottle do
    cellar :any
    sha1 '9c0e09fcd4cef89e4da8b160f230a146a080f454' => :mavericks
    sha1 '11c13fe5b7554c5008e1781fb059fed2d5562db4' => :mountain_lion
    sha1 '5d60c4d5322d09c8c9a8e39be6badf7c3286764b' => :lion
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
end
