require 'formula'

class Ondir < Formula
  homepage 'http://swapoff.org/ondir.html'
  head 'https://github.com/alecthomas/ondir.git'
  url 'http://swapoff.org/files/ondir/ondir-0.2.3.tar.gz'
  sha1 '372962799612d925c1edd6eaca774dc971438bbe'

  bottle do
    cellar :any
    sha1 "31f12eec823af3f6ac6fd7164265f42955e58a81" => :mavericks
    sha1 "2fdf2c742f66c34094e5e1b288cca60a5bcf3dc4" => :mountain_lion
    sha1 "c07b2192679a2cf60e0d47db3fcafdb06fbf109e" => :lion
  end

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end
end
