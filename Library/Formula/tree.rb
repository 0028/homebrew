require 'formula'

class Tree < Formula
  homepage 'http://mama.indstate.edu/users/ice/tree/'
  url 'http://mama.indstate.edu/users/ice/tree/src/tree-1.6.0.tgz'
  sha1 '350f851f68859a011668362dd0e7ee81fd1b713a'

  bottle do
    cellar :any
    sha1 '2a7c997c2a37d7022e4237aade6af53e779a0a65' => :mavericks
    sha1 'c9e04db42d8892ba69f55c92d565c696f666e750' => :mountain_lion
    sha1 '1954eba9c53dcc18df11f5e002732fcfa43548c1' => :lion
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
