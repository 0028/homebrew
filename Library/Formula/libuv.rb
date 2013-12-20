require 'formula'

# Note that x.even are stable releases, x.odd are devel releases
class Libuv < Formula
  homepage 'https://github.com/joyent/libuv'
  url 'https://github.com/joyent/libuv/archive/v0.10.20.tar.gz'
  sha1 'c7e802418b00b0ebc559538d0d26880f484eb52f'

  bottle do
    cellar :any
    sha1 '0e46b4a18f6300933fe9cc1976b5fae2ebeba0ad' => :mavericks
    sha1 'c0142e48d3f7a7c90ad42f03147a8048497e578a' => :mountain_lion
    sha1 '81ca577dc2ba665a680a49907903fc0c860298a2' => :lion
  end

  head 'https://github.com/joyent/libuv.git', :branch => 'master'

  option :universal

  def install
    ENV.universal_binary if build.universal?

    system 'make', 'libuv.dylib'

    include.install Dir['include/*']
    lib.install 'libuv.dylib'
  end
end
