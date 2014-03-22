require 'formula'

class Dotwrp < Formula
  homepage 'https://github.com/mcg1969/dotwrp'
  url 'https://github.com/mcg1969/dotwrp/archive/v1.2.tar.gz'
  sha1 'ec832b1ba160b6c5028af92bc77e725a6588b8bc'
  head 'https://github.com/mcg1969/dotwrp.git'
  bottle do
    cellar :any
    sha1 "15e1740a4bf03c8b6946c0814ec0f64a486967ea" => :mavericks
    sha1 "b0f6630b9175420a79427deb3e6b435d10868ea9" => :mountain_lion
    sha1 "5b64047f89baf4cd65795a59a3d101ef4dd2051b" => :lion
  end

  def install
    system "#{ENV.cc} #{ENV.cflags} -c dotwrp.c"
    system "ar -cru libdotwrp.a dotwrp.o"
    system "ranlib libdotwrp.a"
    lib.install 'libdotwrp.a'
  end
end
