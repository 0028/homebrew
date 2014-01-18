require 'formula'

class T1lib < Formula
  homepage 'http://www.t1lib.org/'
  url 'http://www.ibiblio.org/pub/Linux/libs/graphics/t1lib-5.1.2.tar.gz'
  sha1 '4b4fc22c8688eefaaa8cfc990f0039f95f4287de'

  bottle do
    sha1 '2228b050042d52aedf0678653709072bdf8d4db4' => :mavericks
    sha1 '1d7280525d23bc9d9d219b933fd12d0f45763792' => :mountain_lion
    sha1 '544249be632d13033337dc2d418cc7ad244f76d5' => :lion
  end

  def install
    system './configure', "--prefix=#{prefix}"
    system 'make', 'without_doc'
    system 'make', 'install'
    cp_r 'Fonts', "#{share}/t1lib/fonts"
  end

  test do
    cp "#{share}/t1lib/fonts/type1/bchri.pfb", 'test.pfb'
    system "#{bin}/type1afm", 'test.pfb'
    assert File.exist? 'test.afm'
  end
end
