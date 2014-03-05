require "formula"

class Librtlsdr < Formula
  homepage "http://sdr.osmocom.org/trac/wiki/rtl-sdr"
  url "https://github.com/steve-m/librtlsdr/archive/v0.5.3.tar.gz"
  sha1 "f6f20f7b0562a6d3f7b9ff7bff38a15bff175982"

  bottle do
    cellar :any
    sha1 "48b8209df5fe6c267a1f2627283239c056b5ca4f" => :mavericks
    sha1 "efb65a31c58a2a8cec9566d534ef2d04b50a5657" => :mountain_lion
    sha1 "056f1a92157ee6528e72a89e6be607e87d7460b1" => :lion
  end

  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
