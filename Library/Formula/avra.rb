require 'formula'

class Avra < Formula
  homepage 'http://avra.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/avra/1.3.0/avra-1.3.0.tar.bz2'
  sha1 '7ad7d168b02107d4f2d72951155798c2fd87d5a9'

  bottle do
    cellar :any
    sha1 "6a9ff58bb501b3438cf24a4a5b1d7ee7fb903009" => :mavericks
    sha1 "e9173b7383b2bb7261a33a24d173ba2b85906715" => :mountain_lion
    sha1 "0184b38c56f8c527adea2e5e4b74b797b16413c0" => :lion
  end

  depends_on :autoconf
  depends_on :automake

  def install
    # build fails if these don't exist
    touch 'NEWS'
    touch 'ChangeLog'
    cd "src" do
      system "./bootstrap"
      system "./configure", "--prefix=#{prefix}"
      system "make install"
    end
  end

  test do
    (testpath/"test.asm").write " .device attiny10\n ldi r16,0x42\n"
    output = `#{bin}/avra -l test.lst test.asm`
    assert output.include?("Assembly complete with no errors.")
    assert_equal 0, $?.exitstatus
    assert File.exist?("test.hex")
    assert File.read("test.lst").include?("ldi r16,0x42")
  end
end
