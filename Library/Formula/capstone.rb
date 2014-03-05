require 'formula'

class Capstone < Formula
  homepage 'http://capstone-engine.org'
  url 'http://capstone-engine.org/download/2.1/capstone-2.1.tgz'
  sha1 '3e5fe91684cfc76d73caa857a268332ac9d40659'

  bottle do
    cellar :any
    sha1 "e7b3887ec0f9cf340904a4a2ce7e38f5f586650f" => :mavericks
    sha1 "3317b4704ed459f470d0080a357e20a006a00094" => :mountain_lion
    sha1 "9174e73dc727fda3ca7e4f119cde8ae633659e80" => :lion
  end

  def install
    # Fixed upstream in next version:
    # https://github.com/aquynh/capstone/commit/dc0d04522fa6ca7222124f390f51eb9e106906f7.diff
    inreplace 'Makefile', 'lib64', 'lib'
    system "./make.sh"
    ENV["PREFIX"] = prefix
    system "./make.sh", "install"
  end
end
