require 'formula'

class Ispc < Formula
  homepage 'http://ispc.github.com'
  url 'http://downloads.sourceforge.net/project/ispcmirror/v1.6.0/ispc-v1.6.0-osx.tar.gz'
  sha1 'cea50303a6bfcb213a485ada1337aa4b25807cb8'

  bottle do
    cellar :any
    sha1 '8cb81cd9d2bd3b9a7a935ea2d38020cb08d5c196' => :mavericks
    sha1 '3ccbd9bd061325405cbddf4f3b63771d0f4c3816' => :mountain_lion
    sha1 'd4f32dbd0ef169921c5256a5011e3cade3cc519c' => :lion
  end

  def install
    bin.install 'ispc'
  end

  def test
    system "#{bin}/ispc", "-v"
  end
end
