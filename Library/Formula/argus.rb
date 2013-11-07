require 'formula'

class Argus < Formula
  homepage 'http://qosient.com/argus/'
  url 'http://qosient.com/argus/src/argus-3.0.6.1.tar.gz'
  sha1 '0da193957510fbe1b72875d4ea205453cb7821be'

  bottle do
    cellar :any
    sha1 'd8b9175833c6bbd2c0d11679aa75ed6c5e5680a9' => :mavericks
    sha1 'ff4494b535ecb66a711f9059d0442a49a2984b22' => :mountain_lion
    sha1 '42a268e0da8de9f51e27e396eeac3a7f7b966d37' => :lion
  end

  fails_with :clang do
    build 425
    cause "Undefined symbols for architecture x86_64"
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
