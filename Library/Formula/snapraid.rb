require 'formula'

class Snapraid < Formula
  homepage 'http://snapraid.sourceforge.net/'
  head 'git://snapraid.git.sourceforge.net/gitroot/snapraid/snapraid'
  url 'https://downloads.sourceforge.net/project/snapraid/snapraid-5.3.tar.gz'
  sha1 'f93ace64dc8fd0cf134914a3e11c8d33538d0e77'

  bottle do
    cellar :any
    sha1 "d20e1116bb4916374b59f8a06b4ae926d6151a0d" => :mavericks
    sha1 "86db2f0db399b4f40a1874f7ec9020787c1a59b9" => :mountain_lion
    sha1 "72deee6a881a7f435a2e896acc91861af5802bc8" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
