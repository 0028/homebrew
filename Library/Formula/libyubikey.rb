require 'formula'

class Libyubikey < Formula
  homepage 'http://yubico.github.io/yubico-c/'
  url 'http://yubico.github.io/yubico-c/releases/libyubikey-1.11.tar.gz'
  sha1 'a939abc129ed66af193d979765a8d8ac59ad7c40'

  bottle do
    cellar :any
    sha1 "0d0ccc531e0582ec9fa303873ec8ad04e15d4b84" => :mavericks
    sha1 "38c084b7c14b2b07e2254594a7432f475236db24" => :mountain_lion
    sha1 "ef3b0cd4bca3acdd5db46ab420aad271de4c23e9" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
