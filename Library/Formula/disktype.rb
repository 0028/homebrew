require 'formula'

class Disktype < Formula
  homepage 'http://disktype.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/disktype/disktype/9/disktype-9.tar.gz'
  sha1 '5ccc55d1c47f9a37becce7336c4aa3a7a43cc89c'

  head 'cvs://:pserver:anonymous:@disktype.cvs.sourceforge.net:/cvsroot/disktype:disktype'

  bottle do
    cellar :any
    sha1 '2ddc51b25876a89ef50020aa6a5cb2f3daaafdfd' => :mavericks
    sha1 '5282658d589f61e39efcb53f128c8f7221496001' => :mountain_lion
    sha1 '139b157d47db648965073be62725d6f32e48e32c' => :lion
  end

  def install
    system "make"
    bin.install "disktype"
    man1.install "disktype.1"
  end
end
