require 'formula'

class Pngquant < Formula
  homepage 'http://pngquant.org/'
  url 'https://github.com/pornel/pngquant/archive/2.0.2.tar.gz'
  sha1 'b7d3971d73a628ca5743331cf09bbe2e5574be73'

  head 'https://github.com/pornel/pngquant.git'

  bottle do
    cellar :any
    sha1 "504127331c4fc29948ddded7065766a67ab82160" => :mavericks
    sha1 "86235e17bee0a3854e1413307705ca4a1f83cc98" => :mountain_lion
    sha1 "dadb66af16fb46707148e93ed12e873326cb75f0" => :lion
  end

  depends_on :libpng

  def install
    ENV.append_to_cflags "-DNDEBUG" # Turn off debug
    system "make", "PREFIX=#{prefix}", "CC=#{ENV.cc}"
    bin.install 'pngquant'
    man1.install 'pngquant.1'
  end

  def test
    system "#{bin}/pngquant", "--help"
  end
end
