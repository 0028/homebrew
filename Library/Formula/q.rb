require 'formula'

class Q < Formula
  homepage 'https://github.com/harelba/q'
  url 'https://github.com/harelba/q/archive/1.3.0.tar.gz'
  sha1 '5819ad7b8780b87b413b16a189cdfc8e4a2e53ed'

  bottle do
    cellar :any
    sha1 "62fd14dd7f6a314004eda45d13a8f35c47590d04" => :mavericks
    sha1 "b7791daff7379819947717973fd1a91ce8089cc0" => :mountain_lion
    sha1 "c233da41c84d8454777115f7b569c363f8654099" => :lion
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

