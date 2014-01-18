require 'formula'

# From: Jacques Distler <distler@golem.ph.utexas.edu>
# You can always find the latest version by checking
#    http://golem.ph.utexas.edu/~distler/code/itexToMML/view/head:/itex-src/itex2MML.h
# The corresponding versioned archive is
#    http://golem.ph.utexas.edu/~distler/blog/files/itexToMML-x.x.x.tar.gz

class Itex2mml < Formula
  homepage 'http://golem.ph.utexas.edu/~distler/blog/itex2MML.html'
  url 'http://golem.ph.utexas.edu/~distler/blog/files/itexToMML-1.5.1.tar.gz'
  sha1 'e87cb48c9e0ad357d9e20186e4bd34fc8750b59c'

  bottle do
    cellar :any
    sha1 '607953c2083f0aecbcdf0fbcd12ffc3dabf68c1a' => :mavericks
    sha1 '22827b6b10b5152a78ec65c453531f18d3a0d24c' => :mountain_lion
    sha1 'ed45750e555a9a3aba947e6bd3181a7f601ee4bd' => :lion
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
