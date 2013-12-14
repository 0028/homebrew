require 'formula'

class Lib3ds < Formula
  homepage 'http://code.google.com/p/lib3ds/'
  url 'http://lib3ds.googlecode.com/files/lib3ds-1.3.0.zip'
  sha1 '544262eac73c1e4a1d77f0f1cbd90b990a996db8'

  bottle do
    cellar :any
    sha1 'cb4540139ef71eb61352c44fef5007b8456bb0e6' => :mavericks
    sha1 'f143d4ddf6d3af74677d4ba40eb6100d64d57846' => :mountain_lion
    sha1 '59e2ece31445955229d93ba3f42c89ec47bf6347' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
