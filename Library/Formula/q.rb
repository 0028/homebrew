require 'formula'

class Q < Formula
  homepage 'https://github.com/harelba/q'
  url 'https://github.com/harelba/q/archive/1.2.0.tar.gz'
  sha1 '5c83cb62a9b24f92fe32ef6a137f83191641ff79'

  bottle do
    cellar :any
    sha1 "1a69846d6a1fbd14cf5f1b59655b1c8910537d73" => :mavericks
    sha1 "914e771167586645ba4a2cf3dd3a5a4016cef0a9" => :mountain_lion
    sha1 "514468b658c4e9283294ad543fe810efc1b82f50" => :lion
  end

  def install
    bin.install 'q'
  end

  test do
    IO.popen("#{bin}/q 'select sum(c1) from -'", "w+") do |pipe|
      1.upto(100) { |i| pipe.puts i }
      pipe.close_write
      assert_equal "5050\n", pipe.read
    end
  end
end

