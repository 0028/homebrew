require 'formula'

class Ghi < Formula
  homepage 'https://github.com/stephencelis/ghi'
  url 'https://github.com/stephencelis/ghi/archive/0.9.3.tar.gz'
  head 'https://github.com/stephencelis/ghi.git'
  sha1 '59512443c778cacc8c0488e6ab64965f18b3a279'

  bottle do
    cellar :any
    sha1 "9d57ad6cf4081afb0f5a1caf0de70743ee3f87ae" => :mavericks
    sha1 "49b5a0dd4725b099b00d877db7e90495f685b039" => :mountain_lion
    sha1 "b9c2e0f15a6d098166881fd8ae685355be979a4a" => :lion
  end

  def install
    bin.install "ghi"
    man1.install "man/ghi.1"
  end

  test do
    system "#{bin}/ghi", "--version"
  end
end
