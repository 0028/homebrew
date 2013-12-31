require 'formula'

class Wtf < Formula
  homepage 'http://cvsweb.netbsd.org/bsdweb.cgi/src/games/wtf/'
  url 'http://mirror.aarnet.edu.au/pub/FreeBSD/ports/distfiles/wtf-20130810.tar.gz'
  sha1 '9ca3e9264941273fc21744f861e583e79899a2ee'

  bottle do
    sha1 'a92e10abc3666d6727413b79571d891bf3d00770' => :mavericks
    sha1 'bf1a3dd7d998a59a6236cbb45dc91f1126f06e00' => :mountain_lion
    sha1 'aacc8c3eb6bd9ae6129cb0031e7c5263677ebeaf' => :lion
  end

  def install
    inreplace %w[wtf wtf.6], "/usr/share", share
    bin.install "wtf"
    man6.install "wtf.6"
    (share+"misc").install %w[acronyms acronyms.comp]
  end
end
