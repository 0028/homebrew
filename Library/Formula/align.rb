require 'formula'

class Align < Formula
  homepage 'http://www.cs.indiana.edu/~kinzler/align/'
  url 'http://www.cs.indiana.edu/~kinzler/align/align-1.7.2.tgz'
  sha1 '6cae78d7df4d0a4aae654c37d68b9501810d9bf0'

  bottle do
    cellar :any
    sha1 '582527c0a401f10a1489ff4c51fc3ee73da07e3c' => :mavericks
    sha1 'd9249f1dd00712f8a4211f6578a83e83820366f1' => :mountain_lion
    sha1 '92d08f72d9acdbfc6ded234b8e6a275eb83d7874' => :lion
  end

  def install
    system 'make', 'install', "BINDIR=#{bin}"
  end
end
