require 'formula'

class Mon < Formula
  homepage 'https://github.com/visionmedia/mon'
  url 'https://github.com/visionmedia/mon/archive/1.2.3.tar.gz'
  sha1 '9c5013332b6ecccb6368b100e6aee377e35b5bb1'

  bottle do
    cellar :any
    sha1 '142ce96f928a5cd7201bd7566c3592f49199739e' => :mavericks
    sha1 'd44fc2e3beef51480bde662dd71b3da931f90def' => :mountain_lion
    sha1 '211f1d03a908720ff64e2812b05d634ff2b2f279' => :lion
  end

  def install
    system "make"
    bin.install 'mon'
  end
end
