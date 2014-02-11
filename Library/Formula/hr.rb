require 'formula'

class Hr < Formula
  homepage 'https://github.com/LuRsT/hr'
  head 'https://github.com/LuRsT/hr', :branch => 'master'

  url 'https://raw2.github.com/LuRsT/hr/103e25c7844cfed2dcf17fdcb366dbd6e45105ab/hr', :nounzip => true
  sha1 '165cb02e1deaf3cb6dff312eab097c457aa06083'
  version '0.0.1'

  bottle do
    cellar :any
    sha1 "83b3f521825adb359c5416944a2c9ccd4342b45e" => :mavericks
    sha1 "62dad40b43cf24e0177525187af4753555972ab7" => :mountain_lion
    sha1 "c6ce5bb0ddabb027dadde5a9abf6fe7e88e66421" => :lion
  end

  def install
    bin.install 'hr'
  end

  test do
    system "#{bin}/hr", "-#-"
  end
end
