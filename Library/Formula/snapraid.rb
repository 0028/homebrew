require 'formula'

class Snapraid < Formula
  homepage 'http://snapraid.sourceforge.net/'
  head 'git://snapraid.git.sourceforge.net/gitroot/snapraid/snapraid'
  url 'http://downloads.sourceforge.net/project/snapraid/snapraid-5.2.tar.gz'
  sha1 'b7abe28323eea6fd39152c34e0d26cf8530663db'

  bottle do
    cellar :any
    sha1 'd20baf3a6ed07baaeefbcbf75cdcafe492c22357' => :mavericks
    sha1 'd9566bbb87c3d277f6e911bde92203e9a77fad44' => :mountain_lion
    sha1 'e45999e82220c54ee58ecc745a212966936a2526' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
