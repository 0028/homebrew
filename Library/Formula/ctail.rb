require 'formula'

class Ctail < Formula
  homepage 'http://ctail.i-want-a-pony.com/'
  url 'http://ctail.i-want-a-pony.com/downloads/ctail-0.1.0.tar.bz2'
  sha1 '4bd0373df88136b48cac721c98d34cefda27aff9'

  bottle do
    cellar :any
    sha1 '4b6295f45b3655dd32808435b7a065b9770d2cb1' => :mavericks
    sha1 'adb6b98d94a2d2aab1f339a4cf65d8ba2bdf88c8' => :mountain_lion
    sha1 '447035cc15c2ec2f251132d812fcf4bf28b9c956' => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug"
    system 'make', 'LIBTOOL=glibtool --tag=CC'
    system 'make install'
  end
end
