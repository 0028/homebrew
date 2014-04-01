require 'formula'

class Ykpers < Formula
  homepage 'http://yubico.github.io/yubikey-personalization/'
  url 'http://opensource.yubico.com/yubikey-personalization/releases/ykpers-1.15.1.tar.gz'
  sha1 'dd1478cc106c624318dfe74bb2beda54f18f1fc8'

  bottle do
    cellar :any
    sha1 "4e4f646f37ceb03cf67798daf9e8d3d9d2e32583" => :mavericks
    sha1 "b1d126d47e703d00b975c79b9b36e3fa75665bc5" => :mountain_lion
    sha1 "cbb4079ea22ec8b9cc75e6a47cc56144bd7d8ff9" => :lion
  end

  option :universal

  depends_on 'libyubikey'
  depends_on 'json-c' => :recommended
  depends_on 'pkg-config' => :build

  def install
    ENV.universal_binary if build.universal?
    libyubikey_prefix = Formula["libyubikey"].opt_prefix
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-libyubikey-prefix=#{libyubikey_prefix}",
                          "--with-backend=osx"
    system "make check"
    system "make install"
  end
end
