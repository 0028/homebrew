require 'formula'

class Nasm < Formula
  homepage 'http://www.nasm.us/'
  url 'http://www.nasm.us/pub/nasm/releasebuilds/2.11.02/nasm-2.11.02.tar.bz2'
  sha256 'ece26b5ef565f94d19a72756d05965e424d2e5ca55f88b949852da70dd62f0e0'

  bottle do
    cellar :any
    sha1 "e132eecebd975b058136e8e56b1c9a3751653368" => :mavericks
    sha1 "8eadf122b0aa6d88dab25e18ad2f2e0645ded3bd" => :mountain_lion
    sha1 "96d5cc39bcd7dfbd42537486b0992c7cecc6e184" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}"
    system "make install install_rdf"
  end

  test do
    (testpath/"foo.s").write <<-EOS
      mov eax, 0
      mov ebx, 0
      int 0x80
    EOS

    system "#{bin}/nasm", "foo.s"
    code = File.open("foo", "rb") { |f| f.read.unpack("C*") }
    expected = [0x66, 0xb8, 0x00, 0x00, 0x00, 0x00, 0x66, 0xbb,
                0x00, 0x00, 0x00, 0x00, 0xcd, 0x80]
    assert_equal expected, code
  end
end
