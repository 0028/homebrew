require 'formula'

class Ori < Formula
  homepage 'http://ori.scs.stanford.edu/'
  url 'https://bitbucket.org/orifs/ori/downloads/ori-0.8.1.tgz'
  sha1 '3ad31ab14bdb9305423f66cb919fdc445215f3c9'

  bottle do
    cellar :any
    sha1 "65eaf015a40439e9dded5469f4e760c427667823" => :mavericks
    sha1 "ef6490d7cc0694478092515c0ad68114205f6887" => :mountain_lion
    sha1 "24bb5d449da49340c1ce0e838c667c2e366aa330" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'scons' => :build
  depends_on 'boost'
  depends_on 'osxfuse'
  depends_on 'libevent'
  depends_on 'openssl'

  def install
    system "scons", "BUILDTYPE=RELEASE"
    system "scons", "install", "PREFIX=#{prefix}"
  end

  def test
    system "#{bin}/ori"
  end
end
