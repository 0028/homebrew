require 'formula'

class T1lib < Formula
  homepage 'http://www.t1lib.org/'
  url 'http://www.ibiblio.org/pub/Linux/libs/graphics/t1lib-5.1.2.tar.gz'
  sha1 '4b4fc22c8688eefaaa8cfc990f0039f95f4287de'

  bottle do
    sha1 '190f1e1b194301b8d3987fec108931bb5b3ce90c' => :mavericks
    sha1 'feaca1dd03993c7ab51066f68590ee99cf575be3' => :mountain_lion
    sha1 '49162b73d6695fe214374ee6c3532951003f2130' => :lion
  end

  def install
    system './configure', "--prefix=#{prefix}"
    system 'make', 'without_doc'
    system 'make', 'install'
    share.install 'Fonts' => 'fonts'
  end

  test do
    cp "#{share}/fonts/type1/bchri.pfb", 'test.pfb'
    system "#{bin}/type1afm", 'test.pfb'
    assert File.exist? 'test.afm'
  end
end
