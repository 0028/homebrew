require 'formula'

class Disktype < Formula
  homepage 'http://disktype.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/disktype/disktype/9/disktype-9.tar.gz'
  sha1 '5ccc55d1c47f9a37becce7336c4aa3a7a43cc89c'

  head 'cvs://:pserver:anonymous:@disktype.cvs.sourceforge.net:/cvsroot/disktype:disktype'

  bottle do
    cellar :any
    sha1 "1dbaf8df62c7e5720c3876619116abef4902eb18" => :mavericks
    sha1 "e6fbeb0905b10f0339701f5fdf7f85c5d428840b" => :mountain_lion
    sha1 "e4f671a558f6b04b9e7ea300019696b09cb9a798" => :lion
  end

  def install
    system "make"
    bin.install "disktype"
    man1.install "disktype.1"
  end

  test do
    path = testpath/"foo"
    path.write "1234"

    output = `#{bin}/disktype #{path}`
    assert output.include?("Regular file, size 4 bytes")
    assert_equal 0, $?.exitstatus
  end
end
