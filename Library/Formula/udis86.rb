require 'formula'

class Udis86 < Formula
  homepage 'http://udis86.sourceforge.net'
  url 'http://downloads.sourceforge.net/udis86/udis86-1.7.2.tar.gz'
  sha1 'f55dec2d5319aac9d0a7ae2614ddcc7aa73d3744'

  bottle do
    cellar :any
    sha1 "db012479b3d8cd172673258937778e90aec8626b" => :mavericks
    sha1 "ddc562fab0ed020ace3f30f2a0196835d0e20842" => :mountain_lion
    sha1 "d8a0ed691f48584e0cf8dc56f72409a7b24b4f28" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}",
                          "--enable-shared"
    system "make"
    system "make install"
  end

  test do
    IO.popen("#{bin}/udcli -x", "w+") do |pipe|
      pipe.write "cd 80"
      pipe.close_write
      assert pipe.read.include?("int 0x80")
    end
  end
end
