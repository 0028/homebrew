require 'formula'

class Rename < Formula
  homepage 'http://plasmasturm.org/code/rename'
  url 'https://github.com/ap/rename/archive/v1.600.tar.gz'
  sha1 'a7946ce3602e3810aaa70300674ccb26832634ed'

  bottle do
    cellar :any
    sha1 "a0b2c50794ec69825d01045464442e91b9eea796" => :mavericks
    sha1 "f02ea23f5413d58f4dc44c02ee6119f0e255963f" => :mountain_lion
    sha1 "3e38ba0240ffbf6ca6858a24fab85ba1ba719ef7" => :lion
  end

  def install
    system 'pod2man', 'rename', 'rename.1'
    bin.install 'rename'
    man1.install 'rename.1'
  end

  test do
    touch "foo.doc"
    system "#{bin}/rename -s .doc .txt *.d*"
    assert !File.exist?("foo.doc")
    assert File.exist?("foo.txt")
  end
end
