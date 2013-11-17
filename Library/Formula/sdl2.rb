require 'formula'

class Sdl2 < Formula
  homepage 'http://www.libsdl.org/'
  url 'http://libsdl.org/release/SDL2-2.0.1.tar.gz'
  sha1 'e40051311b648e4e60ed1683f62a948d93a0a49f'

  bottle do
    cellar :any
    sha1 '5b7762fa4688d061a3553d55d0b070c021da82dc' => :mavericks
    sha1 'beb28fe46d3dd38d2c611b842125069cc44825ee' => :mountain_lion
    sha1 'f883160a3b1ef13818b547b83c7e0388a33cee93' => :lion
  end

  head do
    url 'http://hg.libsdl.org/SDL', :using => :hg

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  option :universal

  def install
    # we have to do this because most build scripts assume that all sdl modules
    # are installed to the same prefix. Consequently SDL stuff cannot be
    # keg-only but I doubt that will be needed.
    inreplace %w[sdl2.pc.in sdl2-config.in], '@prefix@', HOMEBREW_PREFIX

    ENV.universal_binary if build.universal?

    system "./autogen.sh" if build.head?

    args = %W[--prefix=#{prefix}]
    # LLVM-based compilers choke on the assembly code packaged with SDL.
    args << '--disable-assembly' if ENV.compiler == :llvm or (ENV.compiler == :clang and MacOS.clang_build_version < 421)
    args << '--without-x'

    system './configure', *args
    system "make install"
  end

  def test
    system "#{bin}/sdl2-config", "--version"
  end
end
