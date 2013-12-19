require 'formula'

# From: Jacques Distler <distler@golem.ph.utexas.edu>
# You can always find the latest version by checking
#    http://golem.ph.utexas.edu/~distler/code/itexToMML/view/head:/itex-src/itex2MML.h
# The corresponding versioned archive is
#    http://golem.ph.utexas.edu/~distler/blog/files/itexToMML-x.x.x.tar.gz

class Itex2mml < Formula
  homepage 'http://golem.ph.utexas.edu/~distler/blog/itex2MML.html'
  url 'http://golem.ph.utexas.edu/~distler/blog/files/itexToMML-1.5.0.tar.gz'
  sha1 'd30ac4327f4e9dc5259950404b45671eb241945e'

  bottle do
    cellar :any
    sha1 'fa8cb42cf3716b46b63fec39680b2b2f1b56d74f' => :mavericks
    sha1 '9e0ff4756b49700fedaf446b35484c74299e1441' => :mountain_lion
    sha1 'a221c315cdb5c37fab98852ccf2b017798804401' => :lion
  end

  def install
    bin.mkpath
    cd "itex-src" do
      system "make"
      system "make", "install", "prefix=#{prefix}", "BINDIR=#{bin}"
    end
  end

  test do
    system "#{bin}/itex2MML", "--version"
  end
end
