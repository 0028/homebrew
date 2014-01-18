require 'formula'

class Dvtm < Formula
  homepage 'http://www.brain-dump.org/projects/dvtm/'
  url 'http://www.brain-dump.org/projects/dvtm/dvtm-0.10.tar.gz'
  sha1 '00e3d6cb746f8eace07e6784452d53781e76db13'
  head 'git://repo.or.cz/dvtm.git'

  bottle do
    cellar :any
    sha1 '9038b28d1598c6eab2e66a82eeb83d5791f33979' => :mavericks
    sha1 '7cf98949155ec4acbc6ea465c7f79ff44d582ca0' => :mountain_lion
    sha1 '9eab3ee536d42491463708c4c6fae8ff7b5e43c8' => :lion
  end

  def install
    inreplace 'config.mk', 'LIBS = -lc -lutil -lncursesw', 'LIBS = -lc -lutil -lncurses'
    inreplace 'Makefile', 'strip -s', 'strip'
    system "make", "PREFIX=#{prefix}", "install"
  end
end
