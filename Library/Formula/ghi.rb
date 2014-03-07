require 'formula'

class Ghi < Formula
  homepage 'https://github.com/stephencelis/ghi'
  url 'https://github.com/stephencelis/ghi/archive/0.9.2.tar.gz'
  head 'https://github.com/stephencelis/ghi.git'
  sha1 'c62c8d0e8e510db82ca3880a13c4f965c728cfb5'

  bottle do
    cellar :any
    sha1 "89cb2b203ef734ef6848e01deb795e008c3196f3" => :mavericks
    sha1 "5103d2d1e90f57c3d7059f52bc7ad06ea764f533" => :mountain_lion
    sha1 "b76e74cfd2d44de53abe2e3664674a55adfecbce" => :lion
  end

  def install
    bin.install "ghi"
    man1.install "man/ghi.1"
  end

  test do
    system "#{bin}/ghi", "--version"
  end
end
