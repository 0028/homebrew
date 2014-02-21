require 'formula'

class Q < Formula
  homepage 'https://github.com/harelba/q'
  url 'https://github.com/harelba/q/archive/1.1.7.tar.gz'
  sha1 '088a4f267167481ae0c0825ad410c897aeaab9e8'

  bottle do
    cellar :any
    sha1 "2fa21fe251224df5a5b43b5b0bb1e96f8c74f238" => :mavericks
    sha1 "5bf914888caec916b2becc0bcb21c8a9eac87e14" => :mountain_lion
    sha1 "a74084c6a0aec7e89debb93b4e111b6ae6af1b25" => :lion
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

