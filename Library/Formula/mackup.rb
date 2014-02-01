require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.6.tar.gz'
  sha1 '29526abfc45dfc04e865e06485aac886306b377f'

  head 'https://github.com/lra/mackup.git'

  bottle do
    sha1 "16014674f1d71e1ac6624d9f69d6c0f91ddfc1de" => :mavericks
    sha1 "0d519f80b6831f894f4c7464abf342733f9cea62" => :mountain_lion
    sha1 "a7626a3bbba7ba1ed3a20073514d0ff5b73ed002" => :lion
  end

  depends_on :python

  def install
    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end

  def test
    system "#{bin}/mackup", '-h'
  end
end
