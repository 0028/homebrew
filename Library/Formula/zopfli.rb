require 'formula'

class Zopfli < Formula
  homepage 'https://code.google.com/p/zopfli/'
  url 'https://zopfli.googlecode.com/files/zopfli-1.0.0.zip'
  sha1 '98ea00216e296bf3a13e241d7bc69490042ea7ce'
  bottle do
    cellar :any
    sha1 'fd6d739950ff07546439fd423e586fdd1ccb0f86' => :mavericks
    sha1 '2adb55ccf82140e4f8eabf5bd89deed3fd989f0c' => :mountain_lion
    sha1 '0ced188d9e4743f9e8eb0ba237d98c45d7c5197f' => :lion
  end

  head 'https://code.google.com/p/zopfli/', :using => :git

  def install
    # Makefile hardcodes gcc
    inreplace 'Makefile', 'gcc', ENV.cc
    system 'make'
    bin.install 'zopfli'
    if build.head?
      system 'make', 'zopflipng'
      bin.install 'zopflipng'
    end
  end

  def caveats; <<-EOS.undent
    NOTE: zopflipng is built when this formula is compiled from HEAD.
    EOS
  end

  test do
    system "#{bin}/zopfli"
  end
end
