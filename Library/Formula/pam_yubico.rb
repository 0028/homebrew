require 'formula'

class PamYubico < Formula
  homepage 'http://opensource.yubico.com/yubico-pam/'
  url 'https://github.com/Yubico/yubico-pam/archive/2.14.tar.gz'
  sha1 'c86fd78788e6a81cadd57b23411e78bd7fab48bb'

  bottle do
    cellar :any
    sha1 "e4fd7f019fa78160bdaf168c61489cdd76ceb515" => :mavericks
    sha1 "0d74edbefa3e1b2a3630b753d88303c2ce6c367d" => :mountain_lion
    sha1 "b64538c93facd9c4a5c5a3aa4a19be648b4ab2a3" => :lion
  end

  option :universal

  depends_on 'pkg-config' => :build
  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'libyubikey'
  depends_on 'ykclient'
  depends_on 'ykpers'

  def install
    ENV.universal_binary if build.universal?

    system "autoreconf -vfi"
    system "./configure", "--prefix=#{prefix}",
                          "--with-libyubikey-prefix=#{HOMEBREW_PREFIX}",
                          "--with-libykclient-prefix=#{HOMEBREW_PREFIX}"
    system "make install"
  end
end
