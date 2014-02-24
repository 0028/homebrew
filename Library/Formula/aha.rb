require "formula"

class Aha < Formula
  homepage "https://github.com/theZiz/aha"
  url "https://github.com/theZiz/aha/archive/0.4.7.tar.gz"
  sha1 "bbf861ea1a98aa72346c2822f1ec40941b84dd53"

  bottle do
    cellar :any
    sha1 "59b2fbbb9e1a9550b27f4d3ab6fdf256b9bc8c88" => :mavericks
    sha1 "3f1395d45a14c0fc17d631829d1c795054d9ba62" => :mountain_lion
    sha1 "8821fba5ab330681fcb2de1a2fe538e22f0f4563" => :lion
  end

  def install
    system "make"
    bin.install "aha"
  end

  test do
    IO.popen("#{bin}/aha", "w+") do |pipe|
      pipe.write("[35mrain[34mpill[00m")
      pipe.close_write
      assert_match /color:purple;">rain.*color:blue;">pill/, pipe.read
    end
  end
end
