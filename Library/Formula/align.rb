require 'formula'

class Align < Formula
  homepage 'http://www.cs.indiana.edu/~kinzler/align/'
  url 'http://www.cs.indiana.edu/~kinzler/align/align-1.7.2.tgz'
  sha1 '6cae78d7df4d0a4aae654c37d68b9501810d9bf0'

  bottle do
    cellar :any
    sha1 "71bc6728b678a5d3052f0f598fabab3d86adcc73" => :mavericks
    sha1 "b7d080a0248e00fa431d3384a3a014dd729a2d12" => :mountain_lion
    sha1 "498fd5c7302275adbf253295bba74b47968e7b68" => :lion
  end

  def install
    system 'make', 'install', "BINDIR=#{bin}"
  end

  test do
    IO.popen(bin/"align", "w+") do |pipe|
      pipe.write "1 1\n12 12\n"
      pipe.close_write
      assert_equal " 1  1\n12 12\n", pipe.read
    end
  end
end
