require 'formula'

class Udis86 < Formula
  homepage 'http://udis86.sourceforge.net'
  url 'https://downloads.sourceforge.net/udis86/udis86-1.7.2.tar.gz'
  sha1 'f55dec2d5319aac9d0a7ae2614ddcc7aa73d3744'

  bottle do
    cellar :any
    sha1 "16556d89995f0939dbead981577b112c0209b6d9" => :mavericks
    sha1 "9d6e8172511ae730ca04ec32f6d50ae4d64c9575" => :mountain_lion
    sha1 "14c64d02ffb353189d4473ff7efe0cc65b97d0b4" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}",
                          "--enable-shared"
    system "make"
    system "make install"
  end

  test do
    assert pipe("#{bin}/udcli -x", "cd 80").include?("int 0x80")
  end
end
