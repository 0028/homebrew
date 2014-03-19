require 'formula'

class Unrar < Formula
  homepage 'http://www.rarlab.com'
  url 'http://www.rarlab.com/rar/unrarsrc-5.1.1.tar.gz'
  sha1 '7d1a8691336208d1d9b85812ba7d5336d2986376'

  bottle do
    cellar :any
    sha1 "4927cfc26f7c32f0065770c6022609e1557bb759" => :mavericks
    sha1 "7e7a46c43086ad5b38e23f631e8b1395e7d191e2" => :mountain_lion
    sha1 "ac64b20e1651559605403de406ebe0cc030c8424" => :lion
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
