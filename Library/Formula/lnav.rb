require 'formula'

class Lnav < Formula
  homepage 'http://lnav.org'
  url 'https://github.com/tstack/lnav/archive/v0.6.1.tar.gz'
  sha1 'fd2bfc5b34af9cb7eea7a10d3722e13bd7adcad7'

  head 'https://github.com/tstack/lnav.git'

  bottle do
    cellar :any
    sha1 '8178c0885c870ecb5bd4400195c291afdcee10e2' => :mavericks
    sha1 '7a44a7df4dac241735ddcdbe45d59e67fdcbb4cd' => :mountain_lion
    sha1 '2293c72ce686dd66d454556dabc5fc457b2327c6' => :lion
  end

  depends_on 'readline'
  depends_on 'pcre'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
