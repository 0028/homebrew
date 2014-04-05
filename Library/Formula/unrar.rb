require 'formula'

class Unrar < Formula
  homepage 'http://www.rarlab.com'
  url 'http://www.rarlab.com/rar/unrarsrc-5.1.2.tar.gz'
  sha1 'e815bbed1e3feceec77e1e33f685dd558cdcc9dd'

  bottle do
    cellar :any
    sha1 "9475d1111c85d2be8780b5ce56e6ef782a25d569" => :mavericks
    sha1 "a91bfc3c7aab2fee42b377ab29d1bc1d952ab687" => :mountain_lion
    sha1 "3510f88c8d6caaaa1ecbef7020dfd53072f7eb12" => :lion
  end

  def install
    system "make"
    bin.install 'unrar'
  end

  test do
    contentpath = "directory/file.txt"
    rarpath = testpath/"archive.rar"
    data =  'UmFyIRoHAM+QcwAADQAAAAAAAACaCHQggDIACQAAAAkAAAADtPej1LZwZE' +
            'QUMBIApIEAAGRpcmVjdG9yeVxmaWxlLnR4dEhvbWVicmV3CsQ9ewBABwA='

    rarpath.write data.unpack('m')
    assert_equal contentpath, `#{bin}/unrar lb #{rarpath}`.strip
    assert_equal 0, $?.exitstatus

    system "#{bin}/unrar", "x", rarpath, testpath
    assert_equal "Homebrew\n", (testpath/contentpath).read
  end
end
