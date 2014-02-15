require 'formula'

class Buildapp < Formula
  homepage 'http://www.xach.com/lisp/buildapp/'
  url 'https://github.com/xach/buildapp/archive/release-1.5.2.tar.gz'
  sha1 'be9a8fbcbd52383041c96f3b761f0d8d8ed66de4'

  bottle do
    sha1 "d87ee7751b25d2fbd56c519f751148d2f87803fd" => :mavericks
    sha1 "bd749f616d3d00b373c590ed4f55271bc6e1fd3a" => :mountain_lion
    sha1 "3fe04b1a0be73a9f9d6dc856d4e7c66aa88b0110" => :lion
  end

  depends_on 'sbcl'

  def install
    bin.mkpath
    system "make", "install", "DESTDIR=#{prefix}"
  end
end
