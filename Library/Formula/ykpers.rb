require 'formula'

class Ykpers < Formula
  homepage 'http://yubico.github.io/yubikey-personalization/'
  url 'http://yubico.github.io/yubikey-personalization/releases/ykpers-1.14.1.tar.gz'
  sha1 '5ecc0d6bf9c58bdf825c2d8d158361fc61852ff8'

  bottle do
    cellar :any
    sha1 "0f40047cc2e6ef8e807c91d27bb5bb0cf7e1c886" => :mavericks
    sha1 "91638670b22b50497d261ae42b35b87a8262872b" => :mountain_lion
    sha1 "88ff4e842d344a2b6ad75b5b99ecdb23b98177f7" => :lion
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
