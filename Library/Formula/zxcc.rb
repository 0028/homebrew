require 'formula'

class Zxcc < Formula
  homepage 'http://www.seasip.info/Unix/Zxcc/'
  url 'http://www.seasip.info/Unix/Zxcc/zxcc-0.5.7.tar.gz'
  sha1 'cc088ef24b2a62fc2673a593982dd62c16136f18'

  bottle do
    sha1 'ac5026aae97e5e798f1a80479e79e072de3143f5' => :mavericks
    sha1 '973c2fc7d368f000dacfe5b84e9949fd12b5ff70' => :mountain_lion
    sha1 '250c615623baee7f3507394df400091a9fc7d17c' => :lion
  end

  depends_on :libtool

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make check"
    system "make install"
  end

  test do
    code = [
      0x11, 0x0b, 0x01,   # 0100 ld de,010bh
      0x0e, 0x09,         # 0103 ld c,cwritestr
      0xcd, 0x05, 0x00,   # 0105 call bdos
      0xc3, 0x00, 0x00,   # 0108 jp warm
      0x48, 0x65, 0x6c,   # 010b db "Hel"
      0x6c, 0x6f, 0x24    # 010e db "lo$"
    ].pack("c*")

    path = testpath/"hello.com"
    path.open("wb") { |f| f.write code }

    output = `#{bin}/zxcc #{path}`.strip
    assert_equal "Hello", output
    assert_equal 0, $?.exitstatus
  end
end
