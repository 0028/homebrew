require 'formula'

class Sdl2 < Formula
  homepage 'http://www.libsdl.org/'
  url 'http://libsdl.org/release/SDL2-2.0.2.tar.gz'
  sha1 '304c7cd3dddca98724a3e162f232a8a8f6e1ceb3'

  bottle do
    cellar :any
    sha1 "fa675277587f0772e559872d1d222857ae3e7052" => :mavericks
    sha1 "7446d8e0a633fa399f3e2b37cb7a76ed9967cd15" => :mountain_lion
    sha1 "4d845eddccd3f6c323967b5f9a124905254bd5fa" => :lion
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

  test do
    system "#{bin}/sdl2-config", "--version"
  end
end
