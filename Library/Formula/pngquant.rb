require 'formula'

class Pngquant < Formula
  homepage 'http://pngquant.org/'
  url 'https://github.com/pornel/pngquant/archive/2.0.1.tar.gz'
  sha1 '46b688b30a039d62a5e7a47d248a16fddd02c3f6'

  head 'https://github.com/pornel/pngquant.git'

  bottle do
    cellar :any
    sha1 '0b9cc3280ebe0e9beb530efc7c97d35936479da8' => :mavericks
    sha1 'da2bb57f37970adfcc00ebf951ec4dca358cb32d' => :mountain_lion
    sha1 '7744b43e26f823679060b33485d38fc975ecec67' => :lion
  end

  depends_on :libpng

  def install
    ENV.append_to_cflags "-DNDEBUG" # Turn off debug
    system "make", "PREFIX=#{prefix}", "CC=#{ENV.cc}"
    bin.install 'pngquant'
    man1.install 'pngquant.1'
  end

  def test
    system "#{bin}/pngquant", "--help"
  end
end
