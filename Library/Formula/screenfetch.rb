require "formula"

class Screenfetch < Formula
  homepage "http://git.silverirc.com/cgit.cgi/screenfetch.git"
  url "http://git.silverirc.com/cgit.cgi/screenfetch.git/snapshot/screenfetch-3.2.2.tar.bz2"
  sha1 "29ec0d68b2799a946dc75b390d96e5f1b2bb8aaf"
  head 'git://git.silverirc.com/screenfetch.git', :shallow => false

  bottle do
    cellar :any
    revision 1
    sha1 "ee7f7c49752cc2f6a7591285ed12c5674a5d7e19" => :mavericks
    sha1 "ffdaa973304f31d0bcc9776ffe617eb64688dfb8" => :mountain_lion
    sha1 "0467fc21111dae838a016293b9e3564b42e58568" => :lion
  end

  def install
    bin.install "screenfetch-dev" => "screenfetch"
  end

  test do
    system "#{bin}/screenfetch"
  end
end
