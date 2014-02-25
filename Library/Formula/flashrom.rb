require "formula"

class Flashrom < Formula
  homepage "http://flashrom.org/"
  url "http://download.flashrom.org/releases/flashrom-0.9.7.tar.bz2"
  sha1 "d08b4073ea3ebf63f03c3e502f4291f50ef348ee"

  head "svn://flashrom.org/flashrom/trunk"

  bottle do
    cellar :any
    sha1 "dedb09849b3ce06354a7005c4a7db5e68581901a" => :mavericks
    sha1 "d7b227f9fef703204deea0696dac0b6fab16ec75" => :mountain_lion
    sha1 "82c09c6be50e8b59b7e5b921a537132bbf29acde" => :lion
  end

  depends_on "libusb-compat"
  depends_on "libftdi0"

  def install
    ENV["CONFIG_GFXNVIDIA"] = "0"
    ENV["CONFIG_NIC3COM"] = "0"
    ENV["CONFIG_NICREALTEK"] = "0"
    ENV["CONFIG_NICINTEL"] = "0"
    ENV["CONFIG_NICINTEL_SPI"] = "0"
    ENV["CONFIG_OGP_SPI"] = "0"
    ENV["CONFIG_SATAMV"] = "0"
    ENV["CONFIG_SATASII"] = "0"
    ENV["CONFIG_DRKAISER"] = "0"
    ENV["CONFIG_RAYER_SPI"] = "0"
    ENV["CONFIG_INTERNAL"] = "0"

    system "make DESTDIR=#{prefix} PREFIX=/ install"
    mv sbin, bin
  end

  test do
    system "#{bin}/flashrom" " --version"
  end
end
