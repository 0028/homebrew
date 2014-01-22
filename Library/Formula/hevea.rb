require 'formula'

class Hevea < Formula
  homepage 'http://hevea.inria.fr/'
  url 'http://hevea.inria.fr/distri/hevea-2.12.tar.gz'
  sha1 '21ca8c366a3fd1030b3cfba3cd2aa16e6baf5c56'

  bottle do
    sha1 "ee061d92ca502541d3dd89ca8d348a5a347d5311" => :mavericks
    sha1 "f20cb72303792d1a6bdae822a031fca082da23c6" => :mountain_lion
    sha1 "991e4cf26b7e6c3f894cfb59ce9da62532b88dfe" => :lion
  end

  depends_on 'objective-caml'
  depends_on 'ghostscript' => :optional

  def install
    inreplace 'Makefile', '/usr/local', prefix
    system "make"
    system "make install"
  end
end
