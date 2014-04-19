require 'formula'

class Exodriver < Formula
  homepage 'http://labjack.com/support/linux-and-mac-os-x-drivers'
  url 'https://github.com/labjack/exodriver/archive/v2.5.3.tar.gz'
  sha1 'd21529987962b1e7178ec7331fc14700caed0692'

  head 'https://github.com/labjack/exodriver.git'

  bottle do
    cellar :any
    sha1 "c688873ab1b48c3c3be97647d5f0b1225a56d8d6" => :mavericks
    sha1 "b6f2756c5dbf4a5d944511c6f0f8d9e8bf45d0a8" => :mountain_lion
    sha1 "70d9e7593d063f8919c1a4d7dafb9cc495a4e05f" => :lion
  end

  depends_on 'libusb'

  option :universal

  def install
    ENV.universal_binary if build.universal?

    cd 'liblabjackusb'
    system "make", "-f", "Makefile",
                   "DESTINATION=#{lib}",
                   "HEADER_DESTINATION=#{include}",
                   "install"
  end
end
