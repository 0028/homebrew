require 'formula'

class Nfcutils < Formula
  homepage 'https://code.google.com/p/nfc-tools/'
  url 'https://nfc-tools.googlecode.com/files/nfcutils-0.3.2.tar.gz'
  sha1 'e560ba7683175257ef9e72838b9f02cf75ce99b8'

  bottle do
    cellar :any
    sha1 'ce6db5625fd73a4cc6fe8039890056b1ade8cbe2' => :mavericks
    sha1 '5fd83ae1acbc115b8eceeccb20ba8033f251828a' => :mountain_lion
    sha1 '7b06bc57eddf6496765d66e517e6727c6f1f07cc' => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on 'pkg-config' => :build
  depends_on 'libnfc'
  depends_on 'libusb'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "type", "lsnfc"
  end
end
