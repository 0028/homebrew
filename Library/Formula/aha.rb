require "formula"

class Aha < Formula
  homepage "https://github.com/theZiz/aha"
  url "https://github.com/theZiz/aha/archive/0.4.7.1.tar.gz"
  sha1 "d428499b5e27bd514ca0ae6826a348b233534f59"

  bottle do
    cellar :any
    sha1 "74f0183f2bdb15f12bef2219134a63139899658f" => :mavericks
    sha1 "a96c0d48f12c15172bc1d2502de3961a8afdc5af" => :mountain_lion
    sha1 "a57b040bdf446d213cd7d58444fab628bb69ec93" => :lion
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
