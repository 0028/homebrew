require 'formula'

class Base64 < Formula
  homepage 'http://www.fourmilab.ch/webtools/base64/'
  url 'http://www.fourmilab.ch/webtools/base64/base64-1.5.tar.gz'
  sha1 '25b5ae71c2818c7a489065ca1637806cd5109524'

  bottle do
    cellar :any
    sha1 "676b197d01303b420740ccc47a55588370b0b0ef" => :mavericks
    sha1 "cdd6f6e5430035b3722a1b2a76928d440c0d6ca4" => :mountain_lion
    sha1 "9de7d1d81f3be8330d53b8c194b523a79485b296" => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking"
    system "make"
    bin.install "base64"
    man1.install "base64.1"
  end

  test do
    path = testpath/"a.txt"
    path.write "hello"

    output = `#{bin}/base64 #{path}`.strip
    assert_equal "aGVsbG8=", output
    assert_equal 0, $?.exitstatus
  end
end
