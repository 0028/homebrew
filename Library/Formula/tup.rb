require 'formula'

class Tup < Formula
  homepage 'http://gittup.org/tup/'
  url 'https://github.com/gittup/tup/archive/v0.7.1.tar.gz'
  sha1 'a0ce259ce74321d2c103e63dffbf9703b7392e16'
  head 'https://github.com/gittup/tup.git'

  bottle do
    cellar :any
    sha1 "ba093bda9159dacb6b1e435f66ac45cb19c40fc0" => :mavericks
    sha1 "367bb3875dfd57d55eb0f5ee334be513b4bf3bbd" => :mountain_lion
    sha1 "ac92e6a7e46460f7cb0755d073f758f19409da70" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'

  def install
    ENV['TUP_LABEL'] = version
    system "./build.sh"
    bin.install 'build/tup'
    man1.install 'tup.1'
  end

  def test
    system "#{bin}/tup", "-v"
  end
end
