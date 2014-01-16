require 'formula'

class Qpdf < Formula
  homepage 'http://qpdf.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/qpdf/qpdf/5.1.1/qpdf-5.1.1.tar.gz'
  sha1 'e407a73bbaf6b1681e0952342e6d66a7746045c3'

  bottle do
    sha1 'a22020f6c67fadb25491f27d4723e7742c8cd041' => :mavericks
    sha1 'dc0c9bc072936d2e202d32db89e45fe285b0037e' => :mountain_lion
    sha1 '1f4037ae556f46a949667b9db9b042146528fcd7' => :lion
  end

  depends_on 'pcre'

  def install
    # find Homebrew's libpcre
    ENV.append 'LDFLAGS', "-L#{Formula.factory('pcre').opt_prefix}/lib"

    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end

  test do
    system "#{bin}/qpdf", "--version"
  end
end
