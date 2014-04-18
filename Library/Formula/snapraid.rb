require 'formula'

class Snapraid < Formula
  homepage 'http://snapraid.sourceforge.net/'
  head 'git://snapraid.git.sourceforge.net/gitroot/snapraid/snapraid'
  url 'https://downloads.sourceforge.net/project/snapraid/snapraid-6.1.tar.gz'
  sha1 '64469900098b297a90d4ccc3e41cd9f447ba76ce'

  bottle do
    cellar :any
    sha1 "1a7b33b1007aa45160ff7fb5ffef46c9f5d6aa7a" => :mavericks
    sha1 "c348214ab153628b2aba55dc84c112e4e6cfb1e4" => :mountain_lion
    sha1 "8587892b30e0804f15329f84a5071fe6d5bfd873" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
