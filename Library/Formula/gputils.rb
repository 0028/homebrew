require 'formula'

class Gputils < Formula
  homepage 'http://gputils.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/gputils/gputils/1.2.0/gputils-1.2.0.tar.gz'
  sha1 '9f3a5d9ee7e2f4f897cd5f8ac56d6679b7c4faba'

  bottle do
    sha1 "8d2ff751888f6eda93c5ed2624a3f99e26ba284a" => :mavericks
    sha1 "cb6a3484c68d14feba6c8d95b7ff400ed1311982" => :mountain_lion
    sha1 "004135fe7a4192d4f0d719163c42bba11999e1dd" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end

  test do
    # assemble with gpasm
    (testpath/"test.asm").write " movlw 0x42\n end\n"
    system "#{bin}/gpasm -p p16f84 test.asm"
    assert File.exist?("test.hex")

    # disassemble with gpdasm
    output = `#{bin}/gpdasm -p p16f84 test.hex`
    assert_equal "000000:  3042  movlw\t0x42\n", output
    assert_equal 0, $?.exitstatus
  end
end
