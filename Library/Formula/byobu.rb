require 'formula'

class Byobu < Formula
  homepage 'http://byobu.co'
  url 'https://launchpad.net/byobu/trunk/5.75/+download/byobu_5.75.orig.tar.gz'
  sha1 'c14e0e3e9e95cef9e9d50074280d0747a02debe5'

  bottle do
    cellar :any
    sha1 "34048720d7b5a1875df1103283209e76e861c408" => :mavericks
    sha1 "2680ac81bd011a33b15cae55c721ef36f66ea986" => :mountain_lion
    sha1 "b9597996e51351aad6a895f27868aaf47dc4bf1b" => :lion
  end

  depends_on 'coreutils'
  depends_on 'gnu-sed' # fails with BSD sed
  depends_on 'tmux'
  depends_on 'newt' => 'with-python'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Add the following to your shell configuration file:
      export BYOBU_PREFIX=$(brew --prefix)
    EOS
  end
end
