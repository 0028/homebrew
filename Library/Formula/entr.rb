require 'formula'

class Entr < Formula
  homepage 'http://entrproject.org/'
  url 'http://entrproject.org/code/entr-2.2.tar.gz'
  sha1 '71eedf5d9397a08a231f0ab400f5aeec4f77571b'

  bottle do
    cellar :any
    sha1 '8bc89f26f526b30dea9e5ceb1057e6cc05890d2d' => :mavericks
    sha1 '0cafd5e06e148aaf32a0d6bd5d3761ca79fee709' => :mountain_lion
    sha1 '711d337f92345e7107b92bca5fec93a6ff4ccd7f' => :lion
  end

  def install
    ENV['PREFIX'] = prefix
    ENV['MANPREFIX'] = man
    system "./configure"
    system "make"
    system "make install"
  end
end
