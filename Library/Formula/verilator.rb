require 'formula'

class Verilator < Formula
  homepage 'http://www.veripool.org/wiki/verilator'
  url 'http://www.veripool.org/ftp/verilator-3.855.tgz'
  sha1 '2c37c48cdcb10674b5c9583a0d2b4f241dbb6dc4'

  bottle do
    sha1 "551a64643ad7628a55fd5552dd1ab32b164daf4b" => :mavericks
    sha1 "2051536499bd011a351263625a3060b0a4df6533" => :mountain_lion
    sha1 "cc3b4b7bf7d85b6559f554034bce313cf92f89ec" => :lion
  end

  skip_clean 'bin' # Allows perl scripts to keep their executable flag

  depends_on "flex"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
