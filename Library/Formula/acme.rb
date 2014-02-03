require 'formula'

class Acme < Formula
  homepage 'http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme/'
  url 'http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme/current/acme091src.tar.gz'
  version '0.91'
  sha1 '7104ea01a2ca2962294aaac4974e10c6486534a8'

  bottle do
    cellar :any
    sha1 "4f2c371ac2c6cecf43cebe76f33c3e598dad670d" => :mavericks
    sha1 "b2a0fd53787cb02dc4ba227b08e999fdc0b4ad37" => :mountain_lion
    sha1 "d7ac524b37ad281005c9b12734d9019e76f696b9" => :lion
  end

  def install
    cd "src" do
      system "make", "install", "BINDIR=#{bin}"
    end
  end

  test do
    path = testpath/"a.asm"
    path.write <<-EOS
      !to "a.out", cbm
      * = $c000
      jmp $fce2
    EOS

    system bin/"acme", path
    code = File.open(testpath/"a.out", "rb") { |f| f.read.unpack("C*") }
    assert_equal [0x00, 0xc0, 0x4c, 0xe2, 0xfc], code
  end
end
