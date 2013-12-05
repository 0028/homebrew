require 'formula'

class Sdl2Gfx < Formula
  homepage 'http://www.ferzkopp.net/joomla/content/view/19/14/'
  url 'http://www.ferzkopp.net/Software/SDL2_gfx/SDL2_gfx-1.0.0.tar.gz'
  sha1 '6b83f57a62a3d2a3850a56902a008d801c799ff8'

  bottle do
    cellar :any
    sha1 '27d6c28f39b10704a4d866ff8a3960d5a55fdcbc' => :mavericks
    sha1 '59977b85fcb55260f0c03255fc9fe30639b9cc09' => :mountain_lion
    sha1 '0ee73ce19b4a6aa15ee9b2e4a15ed6b06fcd82e1' => :lion
  end

  depends_on 'sdl2'

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-sdltest"
    system "make install"
  end
end
