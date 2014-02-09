require 'formula'

class Nasm < Formula
  homepage 'http://www.nasm.us/'
  url 'http://www.nasm.us/pub/nasm/releasebuilds/2.11/nasm-2.11.tar.bz2'
  sha256 '1ce7e897c67255a195367a60c739a90a0b33a4a73f058f7cda3253bcf975642b'

  bottle do
    cellar :any
    sha1 "5ccf423a640cf114a890356fe6b01958f0978fe2" => :mavericks
    sha1 "80d8a3aef3cdd397f892b7e1a8afae48f12b8737" => :mountain_lion
    sha1 "eb523d781e21483712335a762e006aab0ff161bd" => :lion
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
