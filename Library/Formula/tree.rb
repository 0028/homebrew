require 'formula'

class Tree < Formula
  homepage 'http://mama.indstate.edu/users/ice/tree/'
  url 'http://mama.indstate.edu/users/ice/tree/src/tree-1.6.0.tgz'
  sha1 '350f851f68859a011668362dd0e7ee81fd1b713a'

  bottle do
    cellar :any
    sha1 '917e491f52e125844da44ebeb868769ca39687ce' => :mavericks
    sha1 '1155c45070ef303b3c429a21822a96765b4d707e' => :mountain_lion
    sha1 '5aa385f1930d8a2f8d36d7ceb3d8f141531918ab' => :lion
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
