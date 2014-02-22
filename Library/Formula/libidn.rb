require 'formula'

class Libidn < Formula
  homepage 'http://www.gnu.org/software/libidn/'
  url 'http://ftpmirror.gnu.org/libidn/libidn-1.28.tar.gz'
  bottle do
    cellar :any
    sha1 "d063e09a1100d87c6c2d0ed00715d2391e5b79bd" => :mavericks
    sha1 "bf9928361354944904868508727a6a54f3120e32" => :mountain_lion
    sha1 "b50644064d74b3802dc4249d25b3d55b0f9189a8" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/libidn/libidn-1.28.tar.gz'
  sha256 'dd357a968449abc97c7e5fa088a4a384de57cb36564f9d4e0d898ecc6373abfb'

  depends_on 'pkg-config' => :build

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-csharp"
    system "make install"
  end

  def test
    system "#{bin}/idn", "--version"
  end
end
