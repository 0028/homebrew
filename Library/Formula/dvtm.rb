require 'formula'

class Dvtm < Formula
  homepage 'http://www.brain-dump.org/projects/dvtm/'
  url 'http://www.brain-dump.org/projects/dvtm/dvtm-0.11.tar.gz'
  sha1 'f82927afb88e3745dfed11fd39e5f6f9e956099e'
  head 'git://repo.or.cz/dvtm.git'

  bottle do
    cellar :any
    sha1 "a4f19c41d8fff2b5bf83df29b68d6c4beb2a810a" => :mavericks
    sha1 "edff283f057b2e775f7ed7370f44d3349dd56657" => :mountain_lion
    sha1 "59b71d27ae4c0e9a40bdbcc707a695cd2fe8a26d" => :lion
  end

  def install
    inreplace 'config.mk', 'LIBS = -lc -lutil -lncursesw', 'LIBS = -lc -lutil -lncurses'
    inreplace 'Makefile', 'strip -s', 'strip'
    system "make", "PREFIX=#{prefix}", "install"
  end
end
