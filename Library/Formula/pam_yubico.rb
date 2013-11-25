require 'formula'

class PamYubico < Formula
  homepage 'http://opensource.yubico.com/yubico-pam/'
  url 'http://opensource.yubico.com/yubico-pam/releases/pam_yubico-2.14.tar.gz'
  sha1 '3dd6bddce69785c5d61ae0f64ba568e1a81498a1'

  bottle do
    cellar :any
    sha1 '6d2cc5c4650960377140e489fba11ea7065eb7e3' => :mavericks
    sha1 '4779e37daa3c5ec7bf2a532711984b06abe29cec' => :mountain_lion
    sha1 '0bcacff6147d856f8c953b156d57e84d522a6ad6' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'libyubikey'
  depends_on 'ykclient'
  depends_on 'ykpers'

  def install
    system "autoreconf -vfi"
    system "./configure", "--prefix=#{prefix}",
                          "--with-libyubikey-prefix=#{HOMEBREW_PREFIX}",
                          "--with-libykclient-prefix=#{HOMEBREW_PREFIX}"
    system "make install"
  end
end
