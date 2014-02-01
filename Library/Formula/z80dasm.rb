require 'formula'

class Z80dasm < Formula
  homepage 'http://www.tablix.org/~avian/blog/articles/z80dasm/'
  url 'http://www.tablix.org/~avian/z80dasm/z80dasm-1.1.3.tar.gz'
  sha1 'da1e2525bc0db1b86e28f65ba510196998448ed1'

  bottle do
    cellar :any
    sha1 "4ecaba0a164103cf6132030958ece23735eeedc8" => :mavericks
    sha1 "ee4388d96a14ac0518c6124b0a147b7e90285135" => :mountain_lion
    sha1 "d94260a339ed6eac4cf2afffe80534fdd4e97b59" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    path = testpath/"a.bin"
    path.open("wb") { |f| f.write [0xcd, 0x34, 0x12].pack("c*") }

    output = `#{bin}/z80dasm #{path}`.strip
    assert output.include?("call 01234h")
    assert_equal 0, $?.exitstatus
  end
end
