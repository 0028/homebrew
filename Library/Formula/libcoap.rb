require 'formula'

class Libcoap < Formula
  homepage 'http://libcoap.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/libcoap/coap-18/libcoap-4.1.1.tar.gz'
  sha1 '137c0bfe25c735b4a85dde65fdded13e8ef0f48f'

  bottle do
    cellar :any
    sha1 "70b478a670a94af742d512a1b18183f365759b11" => :mavericks
    sha1 "14d2db8386987be704a05e0efb0824301fad0531" => :mountain_lion
    sha1 "540ab888e39fd7d3bbfb6c07e402e7e8dfcf633b" => :lion
  end

  depends_on 'doxygen' => :build

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    include.install "coap.h"
    lib.install "libcoap.a"
    bin.install "examples/coap-server", "examples/coap-client"
  end
end
